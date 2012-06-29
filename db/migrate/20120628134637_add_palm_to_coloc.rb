class AddPalmToColoc < ActiveRecord::Migration
  def change
          add_column :colocs, :palm, :integer
  end
end
