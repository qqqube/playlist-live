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

ActiveRecord::Schema.define(version: 20180611203602) do

  create_table "playlists", force: :cascade do |t|
    t.integer "manager_id"
    t.integer "curr_index"
    t.boolean "active"
    t.string "join_name"
    t.string "join_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "song_id", null: false
  end

  create_table "playlists_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "playlist_id", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "song_name"
    t.string "artist_name"
    t.integer "playlist_id"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "videoID"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
