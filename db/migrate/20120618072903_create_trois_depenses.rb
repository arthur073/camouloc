class CreateTroisDepenses < ActiveRecord::Migration
  def change
    create_table :trois_depenses do |t|
      t.integer :destinataire_id
      t.integer :destinataire_id2
      t.float :montant
      t.string :raison
      t.integer :source_id

      t.timestamps
    end
  end
end
