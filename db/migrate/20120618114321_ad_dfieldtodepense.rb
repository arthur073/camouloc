class AdDfieldtodepense < ActiveRecord::Migration
  def up
	remove_column :depenses, :destinataire_id
        add_column :depenses, :destinataire_part, :float
        add_column :depenses, :destinataire_part2, :float


	remove_column :trois_depenses, :destinataire_id
	remove_column :trois_depenses, :destinataire_id2
        add_column :trois_depenses, :destinataire_part, :float
        add_column :trois_depenses, :destinataire_part2, :float
        add_column :trois_depenses, :destinataire_part3, :float

	remove_column :quatre_depenses, :destinataire_id
	remove_column :quatre_depenses, :destinataire_id2
	remove_column :quatre_depenses, :destinataire_id3
        add_column :quatre_depenses, :destinataire_part, :float
        add_column :quatre_depenses, :destinataire_part2, :float
        add_column :quatre_depenses, :destinataire_part3, :float

  end

  def down
  end
end
