# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
        def change
                drop_table :users
                create_table :users do |t|
                        t.string :nom
                        t.string :email
                        t.integer :colloc_id

                        t.timestamps
                end
        end
        def self.down
                drop_table :users
        end
end
