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

ActiveRecord::Schema.define(version: 20140506122852) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookissues", force: true do |t|
    t.integer  "user_id"
    t.integer  "bookitem_id"
    t.datetime "date_of_issue"
    t.datetime "date_of_return"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",                default: false
    t.datetime "date_of_actual_return"
  end

  add_index "bookissues", ["bookitem_id"], name: "index_bookissues_on_bookitem_id"
  add_index "bookissues", ["user_id"], name: "index_bookissues_on_user_id"

  create_table "bookitems", force: true do |t|
    t.boolean  "availability", default: true
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookitems", ["book_id"], name: "index_bookitems_on_book_id"

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.integer  "author_id"
    t.integer  "number_of_copies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "employee_id"
    t.string   "usertype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
