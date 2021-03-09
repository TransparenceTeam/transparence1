class AddSelectionToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :is_selected?, :boolean, default: false
  end
end
