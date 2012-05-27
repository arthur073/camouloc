class CreateDepenses < ActiveRecord::Migration
  def change
    create_table :depenses do |t|
      t.integer :source_id
      t.integer :destinataire_id
      t.float :montant
      t.string :raison

      t.timestamps
    end
  end
end
