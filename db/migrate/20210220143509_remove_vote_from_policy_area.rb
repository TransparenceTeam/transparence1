class RemoveVoteFromPolicyArea < ActiveRecord::Migration[6.0]
  def change
    remove_column :policy_areas, :vote_id
  end
end
