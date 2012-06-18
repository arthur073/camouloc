class AddTotToUsers < ActiveRecord::Migration
  def change
        add_column :users, :tot, :float
  end
end
