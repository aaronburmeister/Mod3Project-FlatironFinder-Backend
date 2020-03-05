# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_03_004109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frameworks", force: :cascade do |t|
    t.string "name"
    t.string "icon_url"
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_frameworks_on_language_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "icon_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_frameworks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "framework_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["framework_id"], name: "index_user_frameworks_on_framework_id"
    t.index ["user_id"], name: "index_user_frameworks_on_user_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "cohort"
    t.string "campus"
    t.string "github"
    t.string "linkedin"
    t.string "blog"
    t.string "profile_pic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "frameworks", "languages"
  add_foreign_key "user_frameworks", "frameworks"
  add_foreign_key "user_frameworks", "users"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "users"
end
