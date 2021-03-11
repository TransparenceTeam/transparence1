class AddYearToProjectLaws < ActiveRecord::Migration[6.0]
  def change
    add_column :project_laws, :year, :integer
  end
end
