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

ActiveRecord::Schema.define(version: 20160908055142) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "login",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "auth",            limit: 255
    t.integer  "status",          limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "adverts", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "link",                limit: 255
    t.integer  "active",              limit: 4
    t.string   "advert_file_name",    limit: 255
    t.string   "advert_content_type", limit: 255
    t.integer  "advert_file_size",    limit: 4
    t.datetime "advert_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "link",                limit: 255
    t.integer  "active",              limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "banner_file_name",    limit: 255
    t.string   "banner_content_type", limit: 255
    t.integer  "banner_file_size",    limit: 4
    t.datetime "banner_updated_at"
  end

  create_table "clas", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "keyword",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "summary",    limit: 255
    t.integer  "content_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "isshow",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "via",        limit: 4
  end

  create_table "contents", force: :cascade do |t|
    t.string   "title",                      limit: 255
    t.string   "summary",                    limit: 255
    t.text     "content",                    limit: 65535
    t.integer  "cla_id",                     limit: 4
    t.integer  "visit",                      limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "keyword",                    limit: 255
    t.integer  "isshiping",                  limit: 4
    t.integer  "isnew",                      limit: 4
    t.string   "contentimedia_file_name",    limit: 255
    t.string   "contentimedia_content_type", limit: 255
    t.integer  "contentimedia_file_size",    limit: 4
    t.datetime "contentimedia_updated_at"
    t.integer  "via",                        limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.string   "tel",             limit: 255
    t.string   "vcode",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "login",           limit: 255
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "pvdate"
    t.integer  "pv",         limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
