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

ActiveRecord::Schema.define(version: 20130929175304) do

  create_table "admins", force: true do |t|
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
    t.string   "userName"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "streetAddress"
    t.string   "city"
    t.string   "town"
    t.string   "contactNumber"
    t.string   "secContactNumber"
    t.string   "userType"
    t.string   "organization"
    t.string   "user_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "busstops", force: true do |t|
    t.string   "busStopName"
    t.string   "busStopLatLong"
    t.string   "busStopSecName"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.string   "routeName"
    t.decimal  "routeDistance"
    t.string   "routeSourceLatlong"
    t.string   "routeDestLatLong"
    t.decimal  "routeTravelTime"
    t.string   "user_id"
    t.time     "routeStartTime"
    t.time     "routeStopTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
