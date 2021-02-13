class AlterIsFavouriteToUserPosts < ActiveRecord::Migration[6.0]
  def up
    change_table :user_posts do |t|
      t.change :is_favourite, :boolean, :default => false
    end
  end

  def down
    change_table :user_posts do |t|
      t.change :is_favourite, :boolean
    end
  end
end
