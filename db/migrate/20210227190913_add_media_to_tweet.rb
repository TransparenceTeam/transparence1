class AddMediaToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :retweet_photo, :string
    add_column :tweets, :retweet_media, :string
  end
end
