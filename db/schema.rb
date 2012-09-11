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

ActiveRecord::Schema.define(:version => 20120911020610) do

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.string   "current_topic"
    t.string   "slug"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
  end

  add_index "channels", ["name"], :name => "index_channels_on_name", :unique => true
  add_index "channels", ["slug"], :name => "index_channels_on_slug", :unique => true

  create_table "messages", :force => true do |t|
    t.text     "text"
    t.integer  "channel_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
  end

  add_index "messages", ["channel_id"], :name => "index_messages_on_channel_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "onlines", :force => true do |t|
    t.integer  "channel_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "onlines", ["channel_id"], :name => "index_onlines_on_channel_id"
  add_index "onlines", ["user_id"], :name => "index_onlines_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
  end

end
