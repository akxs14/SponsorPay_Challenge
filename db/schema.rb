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

ActiveRecord::Schema.define(version: 20140407090917) do

  create_table "authors_packages", force: true do |t|
    t.integer "developers_id"
    t.integer "packages_id"
  end

  create_table "developers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintainers_packages", force: true do |t|
    t.integer "developers_id"
    t.integer "packages_id"
  end

  create_table "package_versions", force: true do |t|
    t.string   "version"
    t.string   "r_version"
    t.string   "dependencies"
    t.string   "suggestions"
    t.date     "pub_date"
    t.string   "title"
    t.string   "description"
    t.string   "license"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
