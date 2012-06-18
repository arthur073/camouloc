class Renamesourcetouserid < ActiveRecord::Migration
  def change
          rename_column :trois_depenses, :source_id, :user_id
  end
end
