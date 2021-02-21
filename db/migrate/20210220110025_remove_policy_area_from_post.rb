class RemovePolicyAreaFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :policy_area
  end
end
