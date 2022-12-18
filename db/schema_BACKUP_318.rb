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

ActiveRecord::Schema.define(version: 20221203003038) do

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "cal_type"
    t.string "location"
  end

  create_table "users", primary_key: "uid", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.decimal  "weight"
    t.decimal  "height"
    t.integer  "age"
    t.string   "sex"
<<<<<<< HEAD
    t.integer  "goal_weight"
    t.integer  "days"
    t.string   "user_type"
    t.string   "daily_calorie"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
=======
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "goal_weight"
    t.integer  "days"
    t.string   "user_type"
    t.integer  "daily_calorie"
>>>>>>> 8aecf9d7a43480b66d9f0db562135bcd2d8d4bc6
  end

end
