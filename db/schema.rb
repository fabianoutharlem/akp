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

ActiveRecord::Schema.define(version: 20160321114528) do

  create_table "action_pages", force: true do |t|
    t.string   "banner_title"
    t.string   "banner_subtitle"
    t.string   "banner_image"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
    t.integer  "model_id"
    t.string   "slug"
    t.text     "header_title"
    t.text     "header_text"
    t.string   "car_section_title"
    t.text     "car_section_subtitle"
    t.boolean  "orange_banner_enabled"
    t.string   "orange_banner_image"
    t.string   "orange_banner_title"
    t.text     "orange_banner_text"
    t.boolean  "pros_list_enabled"
    t.boolean  "reference_banner_enabled"
    t.string   "reference_image"
    t.integer  "reference_stars"
    t.text     "reference_text"
    t.string   "reference_car_image"
    t.string   "reference_header"
    t.string   "reference_subtitle"
    t.string   "pro_1"
    t.string   "pro_2"
    t.string   "pro_3"
    t.string   "pro_4"
    t.string   "pro_5"
    t.string   "pro_6"
    t.string   "pro_7"
  end

  create_table "blog_pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "templateable_id"
    t.string   "templateable_type"
  end

  add_index "blog_pages", ["slug"], name: "index_blog_pages_on_slug", unique: true, using: :btree

  create_table "blog_template_auto_afbetalings", force: true do |t|
    t.text     "blue_block_left_1"
    t.text     "white_block_left_1"
    t.text     "blue_block_left_2"
    t.string   "image_right_1"
    t.text     "white_block_right_1"
    t.string   "image_right_2"
    t.text     "blue_block_right_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_auto_blogs", force: true do |t|
    t.text     "white_left_block_1"
    t.string   "youtube_embed_url"
    t.string   "image_left_1"
    t.text     "white_block_right_1"
    t.string   "image_left_2"
    t.text     "blue_block_right_1"
    t.text     "orange_block"
    t.text     "white_block_left_2"
    t.string   "image_right_1"
    t.string   "image_left_3"
    t.text     "blue_block_right_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_auto_lease_mogelijkhedens", force: true do |t|
    t.text     "blue_block_left_1"
    t.string   "image_right_1"
    t.text     "white_block_right_1"
    t.string   "image_left_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_full_operational_leases", force: true do |t|
    t.text     "blue_block_left_1"
    t.string   "image_right_1"
    t.string   "image_left_1"
    t.text     "white_block_right_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_keywords", force: true do |t|
    t.string   "nieuw_binnen_titel"
    t.text     "nieuw_binnen_content"
    t.string   "blocks_titel"
    t.text     "blocks_heading"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_lease_gebruikte_autos", force: true do |t|
    t.text     "blue_block_left_1"
    t.string   "image_right_1"
    t.text     "white_block_right_1"
    t.text     "white_block_left_1"
    t.string   "image_right_2"
    t.text     "blue_block_left_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_onze_werkplaats", force: true do |t|
    t.string   "top_image"
    t.text     "top_white_block"
    t.string   "image_left"
    t.text     "blue_block_right"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_opel_eye_trackings", force: true do |t|
    t.string   "top_image"
    t.text     "blue_block"
    t.text     "orange_block"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_template_voordelen_financial_leases", force: true do |t|
    t.text     "blue_block_left_1"
    t.string   "image_right_1"
    t.string   "image_left_1"
    t.text     "white_block_right_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "body_types", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["slug"], name: "index_brands_on_slug", unique: true, using: :btree

  create_table "car_media", force: true do |t|
    t.integer  "car_id"
    t.string   "file"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "avatar_processing", default: false, null: false
  end

  add_index "car_media", ["car_id"], name: "index_car_media_on_car_id", using: :btree

  create_table "car_request_businesses", force: true do |t|
    t.string   "request_type"
    t.integer  "car_id"
    t.string   "email"
    t.string   "phone"
    t.string   "kvk"
    t.string   "date_creation"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "notes"
    t.string   "payment"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "newsletter_subscribe"
    t.string   "woonachtig"
  end

  add_index "car_request_businesses", ["car_id"], name: "index_car_request_businesses_on_car_id", using: :btree

  create_table "car_requests", force: true do |t|
    t.string   "request_type"
    t.string   "payment"
    t.string   "name"
    t.string   "amount"
    t.string   "phone"
    t.string   "license_plate"
    t.string   "email"
    t.string   "bkr"
    t.string   "net_income"
    t.string   "partner_net_income"
    t.string   "rent"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "newsletter_subscribe"
    t.string   "woonachtig"
  end

  create_table "cars", force: true do |t|
    t.string   "slug"
    t.string   "vehicle_number"
    t.string   "vehicle_number_hexon"
    t.integer  "model_id"
    t.integer  "brand_id"
    t.integer  "transmission_type_id"
    t.integer  "body_type_id"
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

  add_index "cars", ["brand_id"], name: "index_cars_on_brand_id", using: :btree
  add_index "cars", ["model_id"], name: "index_cars_on_model_id", using: :btree
  add_index "cars", ["price_50_50"], name: "index_cars_on_price_50_50", using: :btree
  add_index "cars", ["price_month"], name: "index_cars_on_price_month", using: :btree
  add_index "cars", ["price_total"], name: "index_cars_on_price_total", using: :btree
  add_index "cars", ["slug"], name: "index_cars_on_slug", unique: true, using: :btree
  add_index "cars", ["transmission_type_id"], name: "index_cars_on_transmission_type_id", using: :btree
  add_index "cars", ["vehicle_number", "vehicle_number_hexon"], name: "index_cars_on_vehicle_number_and_vehicle_number_hexon", unique: true, using: :btree

  create_table "cms_fields", force: true do |t|
    t.string   "home_foto_1"
    t.string   "home_foto_2"
    t.string   "home_foto_3"
    t.string   "service_bg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "fuel_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.string   "label"
    t.string   "path"
    t.boolean  "last"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "models", force: true do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "models", ["slug"], name: "index_models_on_slug", unique: true, using: :btree

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "rating"
    t.boolean  "approved",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "email"
  end

  create_table "static_texts", force: true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
