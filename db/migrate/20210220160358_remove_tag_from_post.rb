class RemoveTagFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :tag
  end
end
