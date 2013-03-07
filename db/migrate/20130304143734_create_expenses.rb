class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :montant
      t.string :raison
      t.integer :nbr_users
      t.text :parties

      t.timestamps
    end
  end
end
