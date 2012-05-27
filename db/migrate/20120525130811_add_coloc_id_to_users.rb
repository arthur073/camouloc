class AddColocIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coloc_id, :integer
  end
end
