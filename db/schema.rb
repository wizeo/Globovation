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

ActiveRecord::Schema.define(version: 20150416100810) do

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "main_img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "budget"
    t.string   "blurb"
    t.string   "location"
    t.boolean  "is_published"
    t.datetime "published_at"
    t.string   "update1"
    t.string   "update2"
    t.string   "update3"
    t.string   "update4"
    t.string   "update5"
    t.string   "update6"
    t.string   "update7"
    t.string   "update8"
    t.string   "update9"
    t.string   "update10"
    t.string   "update11"
    t.string   "update12"
    t.string   "update13"
    t.string   "update14"
    t.string   "update15"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "solutions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "votes"
    t.boolean  "admin_approval"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "is_published"
    t.string   "blurb"
  end

  add_index "solutions", ["project_id"], name: "index_solutions_on_project_id"
  add_index "solutions", ["user_id"], name: "index_solutions_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
