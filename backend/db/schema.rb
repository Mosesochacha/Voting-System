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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_175304) do
  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.integer "party_id", null: false
    t.integer "position_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_candidates_on_party_id"
    t.index ["position_id"], name: "index_candidates_on_position_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.integer "national_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["national_id"], name: "index_counties_on_national_id"
  end

  create_table "nationals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcounties", force: :cascade do |t|
    t.string "name"
    t.integer "county_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_subcounties_on_county_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "blocked", default: false
    t.integer "failed_login_attempts", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "voters", force: :cascade do |t|
    t.string "id_number"
    t.string "name"
    t.integer "ward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_voters_on_ward_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "name"
    t.integer "subcounty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcounty_id"], name: "index_wards_on_subcounty_id"
  end

  add_foreign_key "candidates", "parties"
  add_foreign_key "candidates", "positions"
  add_foreign_key "counties", "nationals"
  add_foreign_key "subcounties", "counties"
  add_foreign_key "voters", "wards"
  add_foreign_key "wards", "subcounties"
end
