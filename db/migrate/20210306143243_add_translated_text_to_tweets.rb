class AddTranslatedTextToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :translatedtext, :string
  end
end
