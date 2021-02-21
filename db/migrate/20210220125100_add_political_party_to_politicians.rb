class AddPoliticalPartyToPoliticians < ActiveRecord::Migration[6.0]
  def change
    add_reference :politicians, :political_party, null: true, foreign_key: true
  end
end
