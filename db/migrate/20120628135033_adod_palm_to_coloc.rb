class AdodPalmToColoc < ActiveRecord::Migration
  def up
          remove_column :colocs, :palm
          add_column :colocs, :palm, :bool
  end

  def down
  end
end
