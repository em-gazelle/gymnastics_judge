# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170307233200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "final_score"
    t.string   "max_score"
    t.string   "gender"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "routines", force: :cascade do |t|
    t.integer "event_id"
    t.integer "skill_id"
  end

  add_index "routines", ["event_id"], name: "index_routines_on_event_id", using: :btree
  add_index "routines", ["skill_id"], name: "index_routines_on_skill_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string  "skill_name"
    t.string  "element_group"
    t.boolean "acro_series"
    t.boolean "mount"
    t.boolean "dismount"
    t.string  "link"
  end

  add_foreign_key "routines", "events"
  add_foreign_key "routines", "skills"
end
