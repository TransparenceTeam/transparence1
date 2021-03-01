class AddPictureToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :media, :string
    add_column :tweets, :picture, :string
  end
end
