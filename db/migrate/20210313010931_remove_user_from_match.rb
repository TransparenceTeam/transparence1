class RemoveUserFromMatch < ActiveRecord::Migration[6.0]
  def change
    remove_column :matches, :user_id
  end
end
