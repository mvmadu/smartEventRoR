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

ActiveRecord::Schema.define(version: 20141012222755) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "events_file_name"
    t.string   "events_content_type"
    t.integer  "events_file_size"
    t.datetime "events_updated_at"
    t.string   "picture_objects_file_name"
    t.string   "picture_objects_content_type"
    t.integer  "picture_objects_file_size"
    t.datetime "picture_objects_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "Name"
    t.string   "Email"
    t.string   "Password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
