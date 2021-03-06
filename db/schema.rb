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

ActiveRecord::Schema.define(version: 20150216011319) do

  create_table "patients", force: :cascade do |t|
    t.integer  "patientID",  limit: 4
    t.string   "code",       limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "address1",   limit: 255
    t.string   "address2",   limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.string   "phone1",     limit: 255
    t.string   "phone2",     limit: 255
    t.string   "sex",        limit: 255
    t.string   "birthdate",  limit: 255
    t.string   "ssn",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "patients", ["first_name"], name: "index_patients_on_first_name", using: :btree
  add_index "patients", ["last_name"], name: "index_patients_on_last_name", using: :btree
  add_index "patients", ["patientID"], name: "index_patients_on_patientID", unique: true, using: :btree

  create_table "payperiods", force: :cascade do |t|
    t.date     "start"
    t.date     "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeentries", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "time_in"
    t.datetime "time_out"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "temp_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "email",                 limit: 255
    t.integer  "employee_id",           limit: 4
    t.boolean  "admin",                 limit: 1,   default: false
    t.string   "password_hash",         limit: 255
    t.string   "password_salt",         limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "patient_record_access", limit: 1
  end

end
