class AddHastagToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :retweet_hashtag, :string
  end
end
