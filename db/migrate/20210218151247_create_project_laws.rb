class CreateProjectLaws < ActiveRecord::Migration[6.0]
  def change
    create_table :project_laws do |t|
      t.integer :scrutin
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
