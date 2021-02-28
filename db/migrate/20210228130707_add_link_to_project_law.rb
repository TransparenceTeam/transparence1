class AddLinkToProjectLaw < ActiveRecord::Migration[6.0]
  def change
    add_column :project_laws, :url_nojson, :string
  end
end
