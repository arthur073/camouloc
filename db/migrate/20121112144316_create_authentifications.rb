class CreateAuthentifications < ActiveRecord::Migration
  def change
    create_table :authentifications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :index
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
