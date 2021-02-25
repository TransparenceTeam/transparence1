class ChangeTweetsTweetId < ActiveRecord::Migration[6.0]

  def up
    change_table :tweets do |t|
      t.change :tweet_id, :string
    end
  end

  def down
    change_table :tweets do |t|
      t.change :tweet_id, :integer
    end
  end
end
