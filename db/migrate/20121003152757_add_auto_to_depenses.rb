class AddAutoToDepenses < ActiveRecord::Migration
  def change
		add_column :depenses, :auto, :boolean, :default => false
		add_column :trois_depenses, :auto, :boolean, :default => false
		add_column :quatre_depenses, :auto, :boolean, :default => false
  end
end
