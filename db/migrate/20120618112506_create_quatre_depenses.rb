class CreateQuatreDepenses < ActiveRecord::Migration
  def change
    create_table :quatre_depenses do |t|
      t.integer :destinataire_id
      t.integer :destinataire_id2
      t.integer :destinataire_id3
      t.float :montant
      t.string :raison
      t.integer :source_id

      t.timestamps
    end
  end
end
