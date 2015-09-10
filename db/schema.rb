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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150910152100) do
=======
ActiveRecord::Schema.define(version: 20150910120219) do
>>>>>>> master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "mover_id"
    t.integer  "customer_id"
    t.datetime "accepted_at"
    t.datetime "course_start_time"
    t.datetime "travel_start_time"
    t.datetime "travel_end_time"
    t.datetime "course_end_time"
    t.integer  "mover_rating"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "sku"
    t.integer  "price_cents",          default: 0,     null: false
    t.float    "kms"
    t.integer  "time"
    t.string   "status"
    t.json     "payment"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "accepted",             default: false


  end

  add_index "courses", ["customer_id"], name: "index_courses_on_customer_id", using: :btree
  add_index "courses", ["mover_id"], name: "index_courses_on_mover_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "movers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "driving_license_number"
    t.string   "identification_document_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "status"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.string   "course_sku"
    t.integer  "amount_cents", default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "type_of"
    t.string   "address"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "sites", ["course_id"], name: "index_sites_on_course_id", using: :btree

  create_table "trucks", force: :cascade do |t|
    t.integer  "mover_id"
    t.string   "brand"
    t.string   "model"
    t.string   "year"
    t.string   "registration"
    t.string   "truck_identification"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "trucks", ["mover_id"], name: "index_trucks_on_mover_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "token"
    t.datetime "token_expiry"
    t.integer  "profile_id"
    t.string   "profile_type"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_type", "profile_id"], name: "index_users_on_profile_type_and_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "courses", "customers"
  add_foreign_key "courses", "movers"
  add_foreign_key "sites", "courses"
  add_foreign_key "trucks", "movers"
end
