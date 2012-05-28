class CreateColocs < ActiveRecord::Migration
  def change
    create_table :colocs do |t|
      t.string :nom

      t.timestamps
    end
  end
end
