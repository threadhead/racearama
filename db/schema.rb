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

ActiveRecord::Schema.define(:version => 20100924170844) do

  create_table "dens", :force => true do |t|
    t.integer  "pack_id"
    t.string   "den_number"
    t.string   "rank"
    t.string   "leader_name"
    t.string   "leader_email"
    t.string   "assistant_leader_name"
    t.string   "assistant_leader_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "location_name"
    t.string   "location_address1"
    t.string   "location_address2"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zipcode"
    t.string   "derby_chair"
    t.string   "race_manager"
    t.text     "notes"
    t.text     "track"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packs", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "cubmaster_name"
    t.string   "pinewood_derby_chair"
    t.string   "website_url"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scouts", :force => true do |t|
    t.integer  "den_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "parent_email1"
    t.string   "parent_email2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_in",           :default => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "scouts_events", :id => false, :force => true do |t|
    t.integer "scout_id"
    t.integer "event_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

end
