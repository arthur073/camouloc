class AddPrivateToMessages < ActiveRecord::Migration
  def change
          add_column :messages, :private, :integer, :default => 0
  end
end
