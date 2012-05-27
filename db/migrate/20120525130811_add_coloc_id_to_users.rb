class AddColocIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coloc_id, :integer
    remove_column :users, :colloc_id, :integer
  end
end
