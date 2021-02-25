class AddDataToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :tweet_id, :integer
    add_column :tweets, :expanded_tweet_url, :string
    add_column :tweets, :in_reply_to_status, :string
    add_column :tweets, :user_description, :string
    add_column :tweets, :expanded_url, :string
    add_column :tweets, :followers_count, :integer
    add_column :tweets, :friends_count, :integer
    add_column :tweets, :listed_count, :integer
    add_column :tweets, :avatar_url, :string
    add_column :tweets, :avatar_https, :string
    add_column :tweets, :lang, :string
  end
end
