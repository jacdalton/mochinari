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

ActiveRecord::Schema.define(version: 2019_08_21_020314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_path"
  end

  create_table "snack_images", force: :cascade do |t|
    t.bigint "snack_id"
    t.bigint "user_id"
    t.string "image_path"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snack_id"], name: "index_snack_images_on_snack_id"
    t.index ["user_id"], name: "index_snack_images_on_user_id"
  end

  create_table "snack_ratings", force: :cascade do |t|
    t.bigint "snack_id"
    t.bigint "user_id"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snack_id"], name: "index_snack_ratings_on_snack_id"
    t.index ["user_id"], name: "index_snack_ratings_on_user_id"
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "shop_name"
    t.string "shop_location"
    t.float "latitude"
    t.float "longitude"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_snacks_on_category_id"
  end

  create_table "snacks_trails_tables", force: :cascade do |t|
    t.bigint "snack_id"
    t.bigint "trail_id"
    t.index ["snack_id"], name: "index_snacks_trails_tables_on_snack_id"
    t.index ["trail_id"], name: "index_snacks_trails_tables_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.float "longitude"
    t.float "latitude"
    t.index ["user_id"], name: "index_trails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.float "longitude"
    t.float "latitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "snack_images", "snacks"
  add_foreign_key "snack_images", "users"
  add_foreign_key "snack_ratings", "snacks"
  add_foreign_key "snack_ratings", "users"
  add_foreign_key "snacks", "categories"
  add_foreign_key "snacks_trails_tables", "snacks"
  add_foreign_key "snacks_trails_tables", "trails"
  add_foreign_key "trails", "users"
end
