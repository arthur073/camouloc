class RemoveCreateIndexDestroyAuthentification < ActiveRecord::Migration
  def up
          remove_column :authentifications, :create
          remove_column :authentifications, :index
          remove_column :authentifications, :destroy
  end

  def down
  end
end
