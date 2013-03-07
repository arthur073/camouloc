class AddUserIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :user_id, :integer
    add_column :expenses, :auto, :integer, :default => 0
  end
end
