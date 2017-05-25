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

ActiveRecord::Schema.define(version: 20170523113719) do

  create_table "book_shelves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "book_id"
    t.integer  "shelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_shelves_on_book_id", using: :btree
    t.index ["shelf_id"], name: "index_book_shelves_on_shelf_id", using: :btree
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.text     "image",         limit: 65535
    t.integer  "release_year"
    t.integer  "release_month"
    t.integer  "release_day"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "price"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "text",       limit: 65535
    t.integer  "rating"
    t.integer  "book_id"
    t.integer  "user_id"
    t.integer  "shelf_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "status"
    t.index ["book_id"], name: "index_reviews_on_book_id", using: :btree
    t.index ["shelf_id"], name: "index_reviews_on_shelf_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "shelves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "introducing", limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_shelves_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "state",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "name",                                              null: false
    t.text     "image",                  limit: 65535
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "book_shelves", "books"
  add_foreign_key "book_shelves", "shelves"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "shelves"
  add_foreign_key "reviews", "users"
end
