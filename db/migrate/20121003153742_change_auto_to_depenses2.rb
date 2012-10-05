class ChangeAutoToDepenses2 < ActiveRecord::Migration
  def up
          change_column :depenses, :auto, :integer, :default => 0
          change_column :trois_depenses, :auto, :integer, :default => 0
          change_column :quatre_depenses, :auto, :integer, :default => 0
  end

  def down
  end
end
