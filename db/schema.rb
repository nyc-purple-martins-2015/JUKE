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

ActiveRecord::Schema.define(version: 20151120021128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_setlists", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "setlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setlist_songs", force: :cascade do |t|
    t.integer  "setlist_id",              null: false
    t.integer  "song_id",                 null: false
    t.integer  "list_status", default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "setlists", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "name",             null: false
    t.string   "invite_code",      null: false
    t.string   "list_spotify_url", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title",            null: false
    t.string   "artist",           null: false
    t.string   "album",            null: false
    t.string   "song_spotify_url", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "email"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "setlist_song_id", null: false
    t.integer  "value",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
