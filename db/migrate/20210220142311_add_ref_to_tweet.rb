class AddRefToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :ref, :string
  end
end
