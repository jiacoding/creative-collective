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

ActiveRecord::Schema.define(version: 20161120163933) do

  create_table "event_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "reference_table"
    t.integer  "reference_id"
    t.string   "source"
    t.string   "type"
    t.string   "detail"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "project_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "version"
    t.boolean  "active"
    t.string   "type"
    t.binary   "content",     limit: 65535
    t.string   "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["project_id", "user_id", "version"], name: "by_project_user_version", unique: true, using: :btree
  end

  create_table "project_permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "item_type"
    t.boolean  "view_item",     default: true, null: false
    t.boolean  "add_item",      default: true, null: false
    t.boolean  "update_item",   default: true, null: false
    t.boolean  "invite_member", default: true, null: false
    t.boolean  "is_admin",      default: true, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["project_id", "user_id", "item_type"], name: "by_project_user_item_type", unique: true, using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "public",      default: true,     null: false
    t.string   "status",      default: "active", null: false
    t.string   "cover_image"
    t.string   "description"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_foreign_key "project_items", "projects"
  add_foreign_key "project_permissions", "projects"
end
