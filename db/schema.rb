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

ActiveRecord::Schema.define(version: 2019_03_03_212503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "album_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "album_id", null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_comments_on_album_id"
    t.index ["user_id"], name: "index_album_comments_on_user_id"
  end

  create_table "albums", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.string "title", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "downloadable", default: true
    t.integer "genre_id", null: false
    t.boolean "featured", default: false
    t.integer "release_date"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["featured"], name: "index_albums_on_featured"
    t.index ["genre_id"], name: "index_albums_on_genre_id"
    t.index ["title"], name: "index_albums_on_title"
  end

  create_table "artists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "name", null: false
    t.string "website"
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name"
  end

  create_table "songs", force: :cascade do |t|
    t.string "album_id", null: false
    t.string "title", null: false
    t.integer "track_num", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id", "track_num"], name: "index_songs_on_album_id_and_track_num", unique: true
    t.index ["title"], name: "index_songs_on_title"
  end

  create_table "user_collection_albums", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_user_collection_albums_on_album_id"
    t.index ["user_id"], name: "index_user_collection_albums_on_user_id"
  end

  create_table "user_follows", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_user_follows_on_artist_id"
    t.index ["user_id"], name: "index_user_follows_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
