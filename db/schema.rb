# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_13_010931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "url_description"
    t.bigint "political_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["political_group_id"], name: "index_deputies_on_political_group_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor_type_and_favoritor_id"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "policy_area_id", null: false
    t.bigint "project_law_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["policy_area_id"], name: "index_matches_on_policy_area_id"
    t.index ["post_id"], name: "index_matches_on_post_id"
    t.index ["project_law_id"], name: "index_matches_on_project_law_id"
  end

  create_table "policy_areas", force: :cascade do |t|
    t.string "category"
    t.string "subcategory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "political_groups", force: :cascade do |t|
    t.string "ref"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sum_members"
    t.string "avatar"
  end

  create_table "political_parties", force: :cascade do |t|
    t.string "name"
    t.string "ref"
    t.integer "sum_members"
    t.string "avatar"
    t.string "website_url"
    t.bigint "political_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["political_group_id"], name: "index_political_parties_on_political_group_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "twitter_username"
    t.text "bio"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "wikipedia_url"
    t.string "linkedin_url"
    t.bigint "political_party_id"
    t.string "avatar"
    t.index ["political_party_id"], name: "index_politicians_on_political_party_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "policy_area_id"
    t.string "name"
    t.index ["policy_area_id"], name: "index_posts_on_policy_area_id"
    t.index ["tweet_id"], name: "index_posts_on_tweet_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "project_laws", force: :cascade do |t|
    t.integer "scrutin"
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "date"
    t.integer "sum_for"
    t.integer "sum_against"
    t.integer "sum_abstention"
    t.string "owner"
    t.string "LREM_positions"
    t.string "MODEM_positions"
    t.string "SOC_positions"
    t.string "LR_positions"
    t.string "GDR_positions"
    t.string "LT_positions"
    t.string "AE_positions"
    t.string "UDI_positions"
    t.string "NI_positions"
    t.string "LFI_positions"
    t.integer "sum"
    t.string "UAI_positions"
    t.string "position_law"
    t.string "url_nojson"
    t.string "translatedtext"
    t.integer "year"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "username"
    t.text "content"
    t.string "hashtag"
    t.datetime "date"
    t.bigint "politician_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ref"
    t.string "tweet_id"
    t.string "expanded_tweet_url"
    t.string "in_reply_to_status"
    t.string "user_description"
    t.integer "followers_count"
    t.integer "friends_count"
    t.integer "listed_count"
    t.string "avatar_http"
    t.string "avatar_https"
    t.string "lang"
    t.string "location"
    t.string "retweet_username"
    t.string "retweet_date"
    t.string "retweet_id"
    t.string "retweet_content"
    t.string "retweet_location"
    t.string "retweet_user_description"
    t.string "retweet_avatar_http"
    t.string "retweet_avatar_https"
    t.string "retweet_followers_count"
    t.string "retweet_friends_count"
    t.string "retweet_listed_count"
    t.string "retweet_hashtag"
    t.string "retweet_photo"
    t.string "retweet_media"
    t.boolean "is_relevant?"
    t.string "media"
    t.string "picture"
    t.string "translatedtext"
    t.boolean "is_selected?", default: false
    t.string "name"
    t.index ["politician_id"], name: "index_tweets_on_politician_id"
  end

  create_table "user_posts", force: :cascade do |t|
    t.string "vote_type"
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.boolean "is_favourite", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_user_posts_on_post_id"
    t.index ["user_id"], name: "index_user_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "is_contributer", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "deputy_id", null: false
    t.bigint "project_law_id", null: false
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deputy_id"], name: "index_votes_on_deputy_id"
    t.index ["project_law_id"], name: "index_votes_on_project_law_id"
  end

  add_foreign_key "deputies", "political_groups"
  add_foreign_key "matches", "policy_areas"
  add_foreign_key "matches", "posts"
  add_foreign_key "matches", "project_laws"
  add_foreign_key "political_parties", "political_groups"
  add_foreign_key "politicians", "political_parties"
  add_foreign_key "posts", "policy_areas"
  add_foreign_key "posts", "tweets"
  add_foreign_key "posts", "users"
  add_foreign_key "tweets", "politicians"
  add_foreign_key "user_posts", "posts"
  add_foreign_key "user_posts", "users"
  add_foreign_key "votes", "deputies"
  add_foreign_key "votes", "project_laws"
end
