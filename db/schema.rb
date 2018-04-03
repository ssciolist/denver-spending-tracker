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

ActiveRecord::Schema.define(version: 20180403180157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flags", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_flags_on_purchase_id"
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "program_vendor_purchases", force: :cascade do |t|
    t.bigint "vendor_id"
    t.bigint "program_id"
    t.bigint "purchase_id"
    t.index ["program_id"], name: "index_program_vendor_purchases_on_program_id"
    t.index ["purchase_id"], name: "index_program_vendor_purchases_on_purchase_id"
    t.index ["vendor_id"], name: "index_program_vendor_purchases_on_vendor_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string "transaction_date"
    t.string "payment_date"
    t.string "description"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "flags", "purchases"
  add_foreign_key "flags", "users"
  add_foreign_key "program_vendor_purchases", "programs"
  add_foreign_key "program_vendor_purchases", "purchases"
  add_foreign_key "program_vendor_purchases", "vendors"
end
