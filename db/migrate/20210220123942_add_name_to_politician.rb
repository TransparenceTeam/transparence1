class AddNameToPolitician < ActiveRecord::Migration[6.0]
  def change
    add_column :politicians, :name, :string
    add_column :politicians, :wikipedia_url, :string
    add_column :politicians, :linkedin_url, :string
  end
end
