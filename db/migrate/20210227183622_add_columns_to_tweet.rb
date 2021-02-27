class AddColumnsToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :tweet_id, :string
    add_column :tweets, :expanded_tweet_url, :string
    add_column :tweets, :in_reply_to_status, :string
    add_column :tweets, :user_description, :string
    add_column :tweets, :followers_count, :integer
    add_column :tweets, :friends_count, :integer
    add_column :tweets, :listed_count, :integer
    add_column :tweets, :avatar_http, :string
    add_column :tweets, :avatar_https, :string
    add_column :tweets, :lang, :string
    add_column :tweets, :location, :string
    add_column :tweets, :retweet_username, :string
    add_column :tweets, :retweet_date, :string
    add_column :tweets, :retweet_id, :string
    add_column :tweets, :retweet_content, :string
    add_column :tweets, :retweet_location, :string
    add_column :tweets, :retweet_user_description, :string
    add_column :tweets, :retweet_avatar_http, :string
    add_column :tweets, :retweet_avatar_https, :string
    add_column :tweets, :retweet_followers_count, :string
    add_column :tweets, :retweet_friends_count, :string
    add_column :tweets, :retweet_listed_count, :string
  end
end
