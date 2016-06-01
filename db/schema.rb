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

ActiveRecord::Schema.define(version: 20160601170806) do

  create_table "live_rail_communicators", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nadaserve_parsers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "network_analytics", force: :cascade do |t|
    t.integer  "ad_source_connection_id", limit: 4
    t.integer  "impressions",             limit: 4
    t.decimal  "revenue",                            precision: 10
    t.float    "revenue_ecpm",            limit: 24
    t.integer  "bid",                     limit: 4
    t.float    "bid_rate",                limit: 24
    t.datetime "start_timestamp"
    t.datetime "end_timestamp"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

end
