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

ActiveRecord::Schema.define(version: 20161121055002) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street_addr", limit: 255
    t.string   "city",        limit: 255
    t.string   "state",       limit: 255
    t.string   "country",     limit: 255
    t.string   "pincode",     limit: 255
    t.boolean  "preffered",               default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "customer_id", limit: 4
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "address_id", limit: 4
  end

  add_index "customers", ["address_id"], name: "index_customers_on_address_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "category",   limit: 4
    t.integer  "team_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tasks", ["team_id"], name: "index_tasks_on_team_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "avatar",                 limit: 255
    t.boolean  "gender"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.date     "dob"
    t.string   "employee_id",            limit: 255
    t.text     "phone_no",               limit: 65535
    t.text     "status",                 limit: 65535
    t.integer  "team_id",                limit: 4
    t.integer  "category",               limit: 4,     default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "addresses", "customers"
  add_foreign_key "customers", "addresses"
  add_foreign_key "tasks", "teams"
  add_foreign_key "tasks", "users"
  add_foreign_key "teams", "users"
  add_foreign_key "users", "teams"
end
