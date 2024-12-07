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

ActiveRecord::Schema[7.1].define(version: 2024_12_04_035602) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.string "habitat"
    t.string "scientific_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fun_fact"
    t.string "top_speed"
    t.string "life_span"
    t.string "weight"
    t.string "diet"
    t.text "description"
    t.string "group_name"
    t.string "baby_name"
    t.string "height"
    t.string "length"
    t.string "animal_type"
  end

  create_table "park_animals", force: :cascade do |t|
    t.bigint "park_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_park_animals_on_animal_id"
    t.index ["park_id"], name: "index_park_animals_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.string "annual_visitors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "predator_prey_relations", force: :cascade do |t|
    t.integer "predator_id", null: false
    t.integer "prey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["predator_id", "prey_id"], name: "index_predator_prey_relations_on_predator_id_and_prey_id", unique: true
  end

  create_table "user_favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_user_favorites_on_animal_id"
    t.index ["user_id"], name: "index_user_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "park_animals", "animals"
  add_foreign_key "park_animals", "parks"
  add_foreign_key "predator_prey_relations", "animals", column: "predator_id"
  add_foreign_key "predator_prey_relations", "animals", column: "prey_id"
  add_foreign_key "user_favorites", "animals"
  add_foreign_key "user_favorites", "users"
end
