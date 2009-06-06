# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090604014223) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.string   "title",           :null => false
    t.text     "description",     :null => false
    t.string   "cached_tag_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["title"], :name => "index_entries_on_title"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",                      :null => false
    t.integer  "taggable_id",                 :null => false
    t.string   "taggable_type", :limit => 40, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40,  :null => false
    t.string   "name",                      :limit => 100
    t.string   "email",                     :limit => 100, :null => false
    t.string   "crypted_password",          :limit => 40,  :null => false
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.string   "profession"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
