class AddLocalizationToColocs < ActiveRecord::Migration
  def change
	add_column :colocs, :localization, :string
  end
end
