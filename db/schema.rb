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

ActiveRecord::Schema.define(:version => 20101026152210) do

  create_table "neighborhoods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.integer  "startpoint_id"
    t.integer  "endpoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ventypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "url"
    t.boolean  "is_active"
    t.integer  "ventype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.text     "description"
    t.text     "info_html"
    t.text     "deaf_access"
    t.text     "blind_access"
    t.text     "mobility_access"
    t.text     "restroom_access"
    t.integer  "neighborhood_id"
    t.float    "latitude"
    t.float    "longitude"
  end

end
