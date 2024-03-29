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

ActiveRecord::Schema.define(version: 20150508100037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "marathons", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "event_date"
    t.string   "aws_prefix", null: false
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "marathons", ["slug"], name: "index_marathons_on_slug", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "order_id"
    t.decimal  "price",      precision: 12, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["photo_id"], name: "index_order_items_on_photo_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",   precision: 12, scale: 3
    t.decimal  "tax",        precision: 12, scale: 3
    t.decimal  "total",      precision: 12, scale: 3
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "paid",                                default: false
    t.string   "slug"
    t.string   "email"
  end

  add_index "orders", ["slug"], name: "index_orders_on_slug", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "bib"
    t.integer  "place"
    t.integer  "runner_id"
    t.integer  "marathon_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gun_time"
    t.integer  "chip_time"
  end

  add_index "participants", ["bib", "runner_id", "marathon_id"], name: "index_participants_on_bib_and_runner_id_and_marathon_id", unique: true, using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "aws_key"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "participant_id"
    t.integer  "marathon_id"
  end

  create_table "runners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender",     limit: 2, default: 0
    t.integer  "age"
    t.string   "email"
    t.string   "state",      limit: 2
    t.string   "city"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "photos"
end
