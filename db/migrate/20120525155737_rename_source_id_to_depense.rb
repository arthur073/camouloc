class RenameSourceIdToDepense < ActiveRecord::Migration
  def up
	  rename_column :depenses, :source_id, :user_id
  end

  def down
  end
end
