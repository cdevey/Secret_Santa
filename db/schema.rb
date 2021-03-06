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

ActiveRecord::Schema.define(version: 20161214234025) do

  create_table "items", force: :cascade do |t|
    t.text     "item_description"
    t.text     "link"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.integer  "user_id"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "memberships", force: :cascade do |t|
    t.integer  "swap_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "owner"
  end

  add_index "memberships", ["swap_id"], name: "index_memberships_on_swap_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "recipients", force: :cascade do |t|
    t.integer  "swap_id"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recipients", ["recipient_id"], name: "index_recipients_on_recipient_id"
  add_index "recipients", ["swap_id"], name: "index_recipients_on_swap_id"
  add_index "recipients", ["user_id"], name: "index_recipients_on_user_id"

  create_table "swaps", force: :cascade do |t|
    t.text     "location"
    t.datetime "when"
    t.text     "swap_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "email"
    t.string   "password"
    t.text     "shipping_address"
    t.boolean  "organizer"
    t.text     "bio"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wish_lists", ["item_id"], name: "index_wish_lists_on_item_id"
  add_index "wish_lists", ["user_id"], name: "index_wish_lists_on_user_id"

end
