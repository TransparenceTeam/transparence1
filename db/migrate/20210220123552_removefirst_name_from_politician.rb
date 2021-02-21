class RemovefirstNameFromPolitician < ActiveRecord::Migration[6.0]
  def change
    remove_column :politicians, :first_name
    remove_column :politicians, :last_name
    remove_column :politicians, :political_group_id
  end
end
