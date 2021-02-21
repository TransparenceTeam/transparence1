class AddTweeterNameToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :tweeter_name, :string
  end
end
