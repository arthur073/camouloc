class AddPalmToColoc < ActiveRecord::Migration
  def change
          add_column :colocs, :palm, :boolean
  end
end
