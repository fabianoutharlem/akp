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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150430201046) do

  create_table "body_types", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_media", force: true do |t|
    t.integer  "car_id"
    t.string   "file_name"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.string   "vehicle_number"
    t.string   "vehicle_number_hexon"
    t.integer  "model_id"
    t.integer  "brand_id"
    t.integer  "transmission_type_id"
    t.integer  "car_body_type_id"
    t.integer  "fuel_type_id"
    t.integer  "mileage"
    t.string   "color"
    t.string   "color_type"
    t.string   "engine_size"
    t.string   "car_type"
    t.boolean  "nap"
    t.boolean  "rdw"
    t.integer  "price_total"
    t.integer  "price_month"
    t.integer  "price_50_50"
    t.integer  "manufacture_year"
    t.integer  "cylinders"
    t.integer  "engine_power"
    t.integer  "top_speed"
    t.string   "interior"
    t.string   "energy_label"
    t.string   "road_tax"
    t.string   "reserved"
    t.string   "new"
    t.string   "btw_marge"
    t.string   "door_count"
    t.string   "license_plate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars_options", id: false, force: true do |t|
    t.integer "car_id",    null: false
    t.integer "option_id", null: false
  end

  add_index "cars_options", ["car_id", "option_id"], name: "index_cars_options_on_car_id_and_option_id", unique: true, using: :btree

  create_table "contact_requests", force: true do |t|
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuel_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.integer  "menu_id"
    t.string   "label"
    t.string   "action"
    t.integer  "target"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_items", ["ancestry"], name: "index_menu_items_on_ancestry", using: :btree

  create_table "menus", force: true do |t|
    t.string   "name"
    t.integer  "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "page_template_id"
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_texts", force: true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmission_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.boolean  "admin"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
