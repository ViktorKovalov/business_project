ActiveRecord::Schema[7.1].define(version: 2024_04_26_232521) do
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

  add_foreign_key "resting_places", "resorts"
end
