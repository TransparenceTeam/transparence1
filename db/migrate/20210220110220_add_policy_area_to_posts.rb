class AddPolicyAreaToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :policy_area, null: true, foreign_key: true
  end
end
