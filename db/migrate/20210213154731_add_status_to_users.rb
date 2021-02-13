class AddStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_contributer, :boolean, default: false
  end
end
