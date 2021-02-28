class AddIsrelevantToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :is_relevant?, :boolean, default: nil
  end
end
