class AddTweetLocationToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :location, :string
  end
end
