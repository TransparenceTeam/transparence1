class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :username
      t.text :content
      t.string :hashtag
      t.datetime :date
      t.references :politician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
