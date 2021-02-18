class AddPoliticalGroupToPoliticians < ActiveRecord::Migration[6.0]
  def change
    add_reference :politicians, :political_group, null: false, foreign_key: true
  end
end
