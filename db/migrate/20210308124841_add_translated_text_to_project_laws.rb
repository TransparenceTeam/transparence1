class AddTranslatedTextToProjectLaws < ActiveRecord::Migration[6.0]
  def change
    add_column :project_laws, :translatedtext, :string
  end
end
