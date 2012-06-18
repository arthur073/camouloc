class AddNbrusersToColoc < ActiveRecord::Migration
  def change
          add_column :colocs, :nbr_users, :integer
  end
end
