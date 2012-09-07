class Addpalmbontocoloc < ActiveRecord::Migration
  def change
          remove_column :colocs, :palm
          add_column :colocs, :palm, :integer
  end

end
