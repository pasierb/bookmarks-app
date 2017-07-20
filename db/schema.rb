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

ActiveRecord::Schema.define(version: 20170720201311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string "title", null: false
    t.string "url", null: false
    t.string "short"
    t.integer "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "tags", default: [], array: true
    t.index ["short"], name: "index_bookmarks_on_short"
    t.index ["title"], name: "index_bookmarks_on_title"
    t.index ["url"], name: "index_bookmarks_on_url"
  end

  create_table "sites", force: :cascade do |t|
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_sites_on_url", unique: true
  end

  add_foreign_key "bookmarks", "sites"
end
