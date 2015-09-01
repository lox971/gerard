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

ActiveRecord::Schema.define(version: 20150901162707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.integer  "mover_id"
    t.integer  "customer_id"
    t.string   "pick_up_address"
    t.string   "drop_off_address"
    t.datetime "accepted_at"
    t.datetime "course_start_time"
    t.datetime "travel_start_time"
    t.datetime "travel_end_time"
    t.datetime "course_end_time"
    t.integer  "mover_rating"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "courses", ["customer_id"], name: "index_courses_on_customer_id", using: :btree
  add_index "courses", ["mover_id"], name: "index_courses_on_mover_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "movers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "driving_license_number"
    t.string   "identification_document_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.integer  "mover_id"
    t.string   "brand"
    t.string   "model"
    t.string   "year"
    t.string   "registration"
    t.string   "truck_identification"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "trucks", ["mover_id"], name: "index_trucks_on_mover_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.integer  "profile_id"
    t.string   "profile_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_type", "profile_id"], name: "index_users_on_profile_type_and_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "courses", "customers"
  add_foreign_key "courses", "movers"
  add_foreign_key "trucks", "movers"
end
