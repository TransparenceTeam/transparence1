class AddNameToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :name, :string
  end
end
