class AddImageToUsers < ActiveRecord::Migration
  def change
	add_column :users, :image, :string, :default => "no"
  end
end
