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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150529015450) do

  create_table "entourages", :force => true do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.string   "role"
    t.text     "notes"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.string   "gender"
    t.integer  "rank"
  end

  create_table "galileos", :force => true do |t|
    t.string   "controller"
    t.string   "view"
    t.string   "session"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip"
    t.string   "household"
    t.boolean  "rsvp"
    t.string   "food"
    t.string   "aux"
  end

  create_table "guests", :force => true do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.integer  "logins"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.boolean  "rsvp"
    t.string   "food"
    t.integer  "household_id"
  end

  create_table "hotels", :force => true do |t|
    t.string "name"
  end

  create_table "households", :force => true do |t|
    t.string   "household_name"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zip"
    t.string   "email"
    t.integer  "logins"
    t.string   "postal"
  end

  create_table "locations", :force => true do |t|
    t.string   "description"
    t.string   "neighborhood"
    t.string   "category"
    t.text     "notes"
    t.string   "website"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rsvps", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "primary"
    t.integer  "guest_of_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "email"
    t.string   "attending"
    t.integer  "hotel_id"
    t.boolean  "using_shuttle"
  end

  create_table "visitors", :force => true do |t|
    t.string   "group"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visit_count"
  end

end
