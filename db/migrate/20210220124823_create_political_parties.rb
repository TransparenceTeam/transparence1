class CreatePoliticalParties < ActiveRecord::Migration[6.0]
  def change
    create_table :political_parties do |t|
      t.string :name
      t.string :ref
      t.integer :sum_members
      t.string :avatar
      t.string :website_url
      t.references :political_group, null: true, foreign_key: true

      t.timestamps
    end
  end
end
