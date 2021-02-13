class CreatePoliticians < ActiveRecord::Migration[6.0]
  def change
    create_table :politicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :twitter_username
      t.text :bio
      t.string :role

      t.timestamps
    end
  end
end
