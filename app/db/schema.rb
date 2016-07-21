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

ActiveRecord::Schema.define(version: 20160709084923) do

  create_table "project_categories", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "project_inspirations", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.text     "img_url",     limit: 65535, null: false
    t.string   "caption",     limit: 255
    t.integer  "project_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "project_inspirations", ["project_id"], name: "fk_rails_d433d28e4f", using: :btree

  create_table "project_likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "project_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "project_likes", ["project_id"], name: "fk_rails_513d01bb04", using: :btree
  add_index "project_likes", ["user_id"], name: "fk_rails_8db23f111d", using: :btree

  create_table "project_members", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "role",       limit: 255
    t.text     "img_url",    limit: 65535, null: false
    t.integer  "project_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "project_members", ["project_id"], name: "fk_rails_f3b43b5269", using: :btree

  create_table "project_milestones", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "amount_raised",                 precision: 10
    t.decimal  "target_amount",                 precision: 10
    t.integer  "project_id",        limit: 4
    t.integer  "project_status_id", limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "project_milestones", ["project_id"], name: "fk_rails_8ea5131e54", using: :btree
  add_index "project_milestones", ["project_status_id"], name: "fk_rails_b00c17a24f", using: :btree

  create_table "project_rewards", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.decimal  "min_amount",                       precision: 10
    t.text     "description",        limit: 65535
    t.string   "estimated_delivery", limit: 255
    t.integer  "no_of_rewards",      limit: 4
    t.integer  "project_id",         limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "project_rewards", ["project_id"], name: "fk_rails_aa9b027971", using: :btree

  create_table "project_statuses", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "project_types", force: :cascade do |t|
    t.string   "types",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "project_updates", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.text     "img_url",     limit: 65535, null: false
    t.datetime "created_on"
    t.integer  "project_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "project_updates", ["project_id"], name: "fk_rails_4f9b2ad919", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location",            limit: 255
    t.text     "description",         limit: 65535
    t.datetime "created_on"
    t.integer  "user_id",             limit: 4
    t.integer  "project_type_id",     limit: 4
    t.integer  "project_category_id", limit: 4
    t.integer  "project_status_id",   limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "projects", ["project_category_id"], name: "fk_rails_0cbf3d679e", using: :btree
  add_index "projects", ["project_status_id"], name: "fk_rails_9a8c72b8ef", using: :btree
  add_index "projects", ["project_type_id"], name: "fk_rails_d7ca4cafeb", using: :btree
  add_index "projects", ["user_id"], name: "fk_rails_b872a6760a", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "address",         limit: 255
    t.boolean  "is_admin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.boolean  "is_banned"
  end

  add_foreign_key "project_inspirations", "projects"
  add_foreign_key "project_likes", "projects"
  add_foreign_key "project_likes", "users"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_milestones", "project_statuses"
  add_foreign_key "project_milestones", "projects"
  add_foreign_key "project_rewards", "projects"
  add_foreign_key "project_updates", "projects"
  add_foreign_key "projects", "project_categories"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "projects", "project_types"
  add_foreign_key "projects", "users"
end
