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

ActiveRecord::Schema.define(version: 20170903162017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.oid "image"
  end

  create_table "opinions", force: :cascade do |t|
    t.string "author"
    t.text "text"
    t.bigint "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_opinions_on_car_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "e_mail"
    t.string "address"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "car_id"
    t.string "phone_number"
    t.index ["car_id"], name: "index_reservations_on_car_id"
  end

  add_foreign_key "opinions", "cars"
  add_foreign_key "reservations", "cars"
end
