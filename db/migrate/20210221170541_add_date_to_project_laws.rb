class AddDateToProjectLaws < ActiveRecord::Migration[6.0]
  def change
        add_column :project_laws, :date, :string
        add_column :project_laws, :sum_for, :integer
        add_column :project_laws, :sum_against, :integer
        add_column :project_laws, :sum_abstention, :integer
        add_column :project_laws, :owner, :string
        add_column :project_laws, :LREM_positions, :string
        add_column :project_laws, :MODEM_positions, :string
        add_column :project_laws, :SOC_positions, :string
        add_column :project_laws, :LR_positions, :string
        add_column :project_laws, :GDR_positions, :string
        add_column :project_laws, :LT_positions, :string
        add_column :project_laws, :AE_positions, :string
        add_column :project_laws, :UDI_positions, :string
        add_column :project_laws, :NI_positions, :string
        add_column :project_laws, :LFI_positions, :string
  end
end
