class CreateDeputies < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :url_description
      t.references :political_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
