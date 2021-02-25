class AddPositionLawToProjectLaw < ActiveRecord::Migration[6.0]
  def change
    add_column :project_laws, :position_law, :string
  end
end
