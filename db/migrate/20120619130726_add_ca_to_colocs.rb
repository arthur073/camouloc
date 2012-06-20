class AddCaToColocs < ActiveRecord::Migration
  def change
          add_column :colocs, :ca, :float
  end
end
