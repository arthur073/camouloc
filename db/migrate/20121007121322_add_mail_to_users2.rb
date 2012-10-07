class AddMailToUsers2 < ActiveRecord::Migration
  def change
          remove_column :users, :mail
          add_column :users, :mail, :integer, :default => 1
  end
end
