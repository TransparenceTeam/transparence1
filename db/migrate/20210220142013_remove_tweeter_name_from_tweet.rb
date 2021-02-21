class RemoveTweeterNameFromTweet < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :tweeter_name
  end
end
