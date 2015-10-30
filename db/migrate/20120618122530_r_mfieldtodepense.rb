class RMfieldtodepense < ActiveRecord::Migration
  def up
        remove_column :depenses, :destinataire_part2
        remove_column :trois_depenses, :destinataire_part3
        #remove_column :quatre_depenses, :destinataire_part4
  end

  def down
  end
end
