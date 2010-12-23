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

ActiveRecord::Schema.define(:version => 20101216234656) do

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

  add_index "dens", ["pack_id"], :name => "index_dens_on_pack_id"

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
    t.text     "race_day_notes"
    t.text     "track_notes"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "archived"
    t.integer  "track_id"
  end

  add_index "events", ["track_id"], :name => "index_events_on_track_id"

  create_table "events_scouts", :id => false, :force => true do |t|
    t.integer "scout_id"
    t.integer "event_id"
  end

  add_index "events_scouts", ["event_id", "scout_id"], :name => "index_events_scouts_on_event_id_and_scout_id"

  create_table "heat_groups", :force => true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heat_groups", ["event_id"], :name => "index_heat_groups_on_event_id"

  create_table "heats", :force => true do |t|
    t.integer  "heat_group_id"
    t.integer  "heat_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "races_to_generate"
    t.string   "generate_method"
    t.datetime "generate_time"
  end

  add_index "heats", ["heat_group_id"], :name => "index_heats_on_heat_group_id"

  create_table "heats_scouts", :id => false, :force => true do |t|
    t.integer "scout_id"
    t.integer "heat_id"
  end

  add_index "heats_scouts", ["heat_id", "scout_id"], :name => "index_heats_scouts_on_heat_id_and_scout_id"

  create_table "lane_assignments", :force => true do |t|
    t.integer  "lane"
    t.integer  "scout_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lane_assignments", ["race_id"], :name => "index_lane_assignments_on_race_id"

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

  create_table "race_times", :force => true do |t|
    t.integer  "lane"
    t.integer  "lane_id"
    t.float    "elapsed_seconds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.integer  "heat_id"
    t.boolean  "current",    :default => false
    t.boolean  "completed",  :default => false
    t.integer  "index",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "races", ["completed"], :name => "index_races_on_completed"
  add_index "races", ["current"], :name => "index_races_on_current"
  add_index "races", ["heat_id"], :name => "index_races_on_heat_id"

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

  add_index "scouts", ["checked_in"], :name => "index_scouts_on_checked_in"
  add_index "scouts", ["den_id"], :name => "index_scouts_on_den_id"

  create_table "settings", :force => true do |t|
    t.string   "daq_controller_host"
    t.string   "daq_controller_port"
    t.string   "api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.integer  "pack_id"
    t.integer  "total_lanes"
    t.string   "active_lanes"
    t.datetime "created_at"
    t.datetime "updated_at"
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
