class AddNameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :name, :string
  end
end
