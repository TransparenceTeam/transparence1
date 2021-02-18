class CreatePoliticalGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :political_groups do |t|
      t.string :ref
      t.string :name

      t.timestamps
    end
  end
end
