class Changefielddepenses < ActiveRecord::Migration
  def up
        remove_column :depenses, :destinataire_part
        remove_column :depenses, :destinataire_part2
        add_column :depenses, :destinataire_part2, :integer
        add_column :depenses, :destinataire_part, :integer


        remove_column :trois_depenses, :destinataire_part
        remove_column :trois_depenses, :destinataire_part2
        remove_column :trois_depenses, :destinataire_part3
        add_column :trois_depenses, :destinataire_part, :integer
        add_column :trois_depenses, :destinataire_part2, :integer
        add_column :trois_depenses, :destinataire_part3, :integer

        remove_column :quatre_depenses, :destinataire_part
        remove_column :quatre_depenses, :destinataire_part2
        remove_column :quatre_depenses, :destinataire_part3
        remove_column :quatre_depenses, :destinataire_part4
        add_column :quatre_depenses, :destinataire_part, :integer
        add_column :quatre_depenses, :destinataire_part2, :integer
        add_column :quatre_depenses, :destinataire_part3, :integer
        add_column :quatre_depenses, :destinataire_part4, :integer

  end

  def down
  end
end
