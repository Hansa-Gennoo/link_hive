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

ActiveRecord::Schema[7.1].define(version: 2025_10_07_174738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "landing_pages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "username"
    t.text "bio"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_landing_pages_on_slug", unique: true
    t.index ["user_id"], name: "index_landing_pages_on_user_id"
    t.index ["username"], name: "index_landing_pages_on_username", unique: true
  end

  create_table "links", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "landing_page_id", null: false
    t.index ["landing_page_id"], name: "index_links_on_landing_page_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.boolean "base"
    t.string "primary_colour"
    t.string "accent_colour"
    t.string "background_colour"
    t.string "font_heading"
    t.string "font_body"
    t.boolean "customisable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_themes_on_key"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "landing_pages", "users"
  add_foreign_key "links", "landing_pages"
end
