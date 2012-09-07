# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120628135033) do

	create_table "colocs", :force => true do |t|
		t.string   "nom"
		t.datetime "created_at",         :null => false
		t.datetime "updated_at",         :null => false
		t.float    "ca"
		t.integer  "palm"
	end


	create_table "depenses", :force => true do |t|
		t.integer  "user_id"
		t.float    "montant"
		t.string   "raison"
		t.datetime "created_at",         :null => false
		t.datetime "updated_at",         :null => false
		t.integer  "destinataire_part2"
		t.integer  "destinataire_part"
		t.integer  "nbr_users"
	end

	create_table "quatre_depenses", :force => true do |t|
		t.float    "montant"
		t.string   "raison"
		t.integer  "user_id"
		t.datetime "created_at",         :null => false
		t.datetime "updated_at",         :null => false
		t.integer  "destinataire_part"
		t.integer  "destinataire_part2"
		t.integer  "destinataire_part3"
		t.integer  "destinataire_part4"
		t.integer  "nbr_users"
	end

	create_table "trois_depenses", :force => true do |t|
		t.float    "montant"
		t.string   "raison"
		t.integer  "user_id"
		t.datetime "created_at",         :null => false
		t.datetime "updated_at",         :null => false
		t.integer  "destinataire_part"
		t.integer  "destinataire_part2"
		t.integer  "destinataire_part3"
		t.integer  "nbr_users"
	end

	create_table "users", :force => true do |t|
		t.string   "nom"
		t.string   "email"
		t.datetime "created_at",                            :null => false
		t.datetime "updated_at",                            :null => false
		t.string   "encrypted_password"
		t.string   "salt"
		t.boolean  "admin",              :default => false
		t.integer  "coloc_id"
		t.float    "tot"
	end

end
