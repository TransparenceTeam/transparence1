class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :deputy, null: false, foreign_key: true
      t.references :project_law, null: false, foreign_key: true
      t.string :position

      t.timestamps
    end
  end
end

