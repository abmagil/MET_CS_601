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

ActiveRecord::Schema.define(:version => 20131201003703) do

  create_table "parties", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "table_id"
    t.boolean  "seated"
    t.boolean  "done"
  end

  create_table "restaurants", :force => true do |t|
    t.float    "cash_on_hand"
    t.integer  "customers_served"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tables", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "capacity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name",          :null => false
    t.boolean  "occupied"
    t.string   "type"
    t.integer  "x"
    t.integer  "y"
    t.integer  "width"
    t.integer  "height"
    t.integer  "radius"
    t.integer  "waiter_id"
  end

  create_table "waiters", :force => true do |t|
    t.boolean  "onduty"
    t.boolean  "good"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "name"
    t.float    "bank_account", :default => 100.0
  end

end
