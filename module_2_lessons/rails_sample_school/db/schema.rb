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

ActiveRecord::Schema.define(version: 20150106181000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string  "address"
    t.integer "student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "course_number"
    t.string  "difficulty"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "address"
    t.string  "size"
    t.string  "name"
  end

  create_table "stores_customres", force: :cascade do |t|
    t.integer "store_id"
    t.integer "customer_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_alumnus"
  end

end
