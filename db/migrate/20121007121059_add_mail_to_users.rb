class AddMailToUsers < ActiveRecord::Migration
  def change
          add_column :users, :mail, :integer
  end
end
