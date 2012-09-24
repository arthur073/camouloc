class AddSourceToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :source_id, :integer
  end
end
