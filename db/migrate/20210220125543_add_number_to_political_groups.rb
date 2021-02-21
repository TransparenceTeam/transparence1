class AddNumberToPoliticalGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :political_groups, :sum_members, :integer
    add_column :political_groups, :avatar, :string
  end
end
