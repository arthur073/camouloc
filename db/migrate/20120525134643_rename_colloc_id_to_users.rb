class RenameCollocIdToUsers < ActiveRecord::Migration
  def up
	  rename_column :users, :colloc_id, :coloc_id
  end

  def down
  end
end
