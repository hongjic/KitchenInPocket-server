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

ActiveRecord::Schema.define(version: 20161103233151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favors", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "recipe_id", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string  "name",      limit: 20, null: false
    t.integer "recipe_id",            null: false
    t.string  "amount",    limit: 10, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string  "name",        limit: 30, null: false
    t.integer "user_id",                null: false
    t.string  "user_name",   limit: 20, null: false
    t.text    "picture"
    t.integer "create_time", limit: 8,  null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer "recipe_id",             null: false
    t.integer "index",                 null: false
    t.text    "picture"
    t.string  "content",   limit: 100, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "name",        limit: 20, null: false
    t.string  "password",    limit: 20, null: false
    t.integer "create_time", limit: 8,  null: false
    t.string  "intro",       limit: 50
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

  add_foreign_key "favors", "recipes"
  add_foreign_key "favors", "users"
  add_foreign_key "follows", "users", column: "followed_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "steps", "recipes"
end
