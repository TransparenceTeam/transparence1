class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :post, null: false, foreign_key: true
      t.references :policy_area, null: false, foreign_key: true
      t.references :project_law, null: false, foreign_key: true

      t.timestamps
    end
  end
end
