class RemoveNbrusersToColoc < ActiveRecord::Migration
  def up
          remove_column :colocs, :nbr_users
          add_column :depenses, :nbr_users, :integer
          add_column :trois_depenses, :nbr_users, :integer
          add_column :quatre_depenses, :nbr_users, :integer
  end

  def down
  end
end
