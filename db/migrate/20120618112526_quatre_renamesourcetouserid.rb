class QuatreRenamesourcetouserid < ActiveRecord::Migration
  def up
          rename_column :quatre_depenses, :source_id, :user_id
  end

  def down
  end
end
