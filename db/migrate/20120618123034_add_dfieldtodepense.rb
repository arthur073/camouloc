class AddDfieldtodepense < ActiveRecord::Migration
  def up
        add_column :depenses, :destinataire_part2, :float
        add_column :trois_depenses, :destinataire_part3, :float
        add_column :quatre_depenses, :destinataire_part4, :float
  end

  def down
  end
end
