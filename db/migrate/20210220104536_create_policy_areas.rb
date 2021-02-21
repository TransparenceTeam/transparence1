class CreatePolicyAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :policy_areas do |t|
      t.string :category
      t.string :subcategory
      t.references :vote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
