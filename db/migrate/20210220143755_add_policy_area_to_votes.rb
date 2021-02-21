class AddPolicyAreaToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :policy_area, null: true, foreign_key: true
  end
end
