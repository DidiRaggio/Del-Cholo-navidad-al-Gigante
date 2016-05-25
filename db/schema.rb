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

ActiveRecord::Schema.define(version: 20160523225425) do

  create_table "test_objects", force: :cascade do |t|
    t.integer  "ad_source_connection_id"
    t.integer  "impressions"
    t.integer  "revenue"
    t.integer  "revenue_ecpm"
    t.integer  "bid"
    t.integer  "bid_rate"
    t.datetime "run_start_timestamp"
    t.datetime "run_end_timestamp"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "testobjects", force: :cascade do |t|
    t.integer  "ad_source_connection_id"
    t.integer  "impressions"
    t.integer  "revenue"
    t.integer  "revenue_ecpm"
    t.integer  "bid"
    t.integer  "bid_rate"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
