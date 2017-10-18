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

ActiveRecord::Schema.define(version: 20171017134252) do

  create_table "activity_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_types_attractions", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "attraction_id", null: false
    t.bigint "activity_type_id", null: false
    t.index ["activity_type_id", "attraction_id"], name: "index_act_att_on_act_id_and_att_id"
    t.index ["attraction_id", "activity_type_id"], name: "index_act_att_on_att_id_and_act_id"
  end

  create_table "attractions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "longitude", limit: 24
    t.float "latitude", limit: 24
    t.text "speciality"
    t.string "place_id"
    t.bigint "activiy_types_id"
    t.bigint "attractions_activity_types_id"
    t.index ["activiy_types_id"], name: "index_attractions_on_activiy_types_id"
    t.index ["attractions_activity_types_id"], name: "index_attractions_on_attractions_activity_types_id"
  end

  create_table "attractions_locations", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "location_id", null: false
    t.bigint "attraction_id", null: false
    t.index ["attraction_id", "location_id"], name: "index_attractions_locations_on_attraction_id_and_location_id"
    t.index ["location_id", "attraction_id"], name: "index_attractions_locations_on_location_id_and_attraction_id"
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "country"
    t.float "longitude", limit: 24
    t.float "latitude", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "city"
    t.string "search"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "password_digest"
  end

end
