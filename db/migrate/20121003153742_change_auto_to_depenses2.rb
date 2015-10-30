class ChangeAutoToDepenses2 < ActiveRecord::Migration
        def up
                #remove_column :depenses, :auto
                remove_column :quatre_depenses, :auto
                remove_column :trois_depenses, :auto
                add_column :depenses, :auto, :integer, :default => 0
                add_column :trois_depenses, :auto, :integer, :default => 0
                add_column :quatre_depenses, :auto, :integer, :default => 0
        end

        def down
        end
end
