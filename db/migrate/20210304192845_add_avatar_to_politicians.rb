class AddAvatarToPoliticians < ActiveRecord::Migration[6.0]
  def change
    add_column :politicians, :avatar, :string
  end
end
