# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_29_193515) do
  create_table "booking_enquiries", force: :cascade do |t|
    t.integer "resting_place_id"
    t.string "name", null: false
    t.string "email", null: false
    t.integer "phone_number", null: false
    t.date "check_in_date", null: false
    t.date "check_out_date", null: false
    t.text "additional_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resting_place_id"], name: "index_booking_enquiries_on_resting_place_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
  end

  create_table "feedback_requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resorts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
  end

  create_table "resting_places", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "resort_id", null: false
    t.string "room_number"
    t.string "room_description"
    t.integer "bed_count"
    t.decimal "price_per_night"
    t.index ["resort_id"], name: "index_resting_places_on_resort_id"
  end

  add_foreign_key "booking_enquiries", "resting_places"
  add_foreign_key "resting_places", "resorts"
end
