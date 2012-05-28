class RemoveCollocIdToUsers < ActiveRecord::Migration
  def change
	  remove_column :users, :colloc_id
  end
end
