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

ActiveRecord::Schema.define(:version => 20130917165631) do

  create_table "companies", :force => true do |t|
    t.string "name"
  end

  create_table "deliveries", :force => true do |t|
    t.string "name"
    t.string "phone"
    t.string "delivery_type"
  end

  create_table "delivery_calls", :force => true do |t|
    t.datetime "delivery_time"
    t.integer  "delivery_id"
    t.integer  "calling_user_id"
    t.string   "status",          :default => "started"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delivery_calls", ["calling_user_id"], :name => "index_delivery_calls_on_calling_user_id"
  add_index "delivery_calls", ["delivery_id"], :name => "index_delivery_calls_on_delivery_id"

  create_table "delivery_requests", :force => true do |t|
    t.integer "user_id"
    t.integer "delivery_call_id"
  end

  add_index "delivery_requests", ["delivery_call_id"], :name => "index_delivery_requests_on_delivery_call_id"
  add_index "delivery_requests", ["user_id"], :name => "index_delivery_requests_on_user_id"

  create_table "delivery_requests_menus", :id => false, :force => true do |t|
    t.integer "delivery_request_id"
    t.integer "menu_id"
  end

  create_table "menus", :force => true do |t|
    t.float   "price"
    t.string  "description"
    t.integer "delivery_id"
  end

  add_index "menus", ["delivery_id"], :name => "index_menus_on_delivery_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], :name => "index_users_on_company_id"

end
