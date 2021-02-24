class AddSumToProjectLaw < ActiveRecord::Migration[6.0]
  def change
    add_column :project_laws, :sum, :integer
    add_column :project_laws, :UAI_positions, :string
  end
end
