class CreateCollocs < ActiveRecord::Migration
  def change
    create_table :collocs do |t|
      t.string :nom

      t.timestamps
    end
  end
end
