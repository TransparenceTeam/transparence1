class RemovePolicyAreaFromVote < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :policy_area_id
  end
end
