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

ActiveRecord::Schema.define(version: 2023_09_25_133704) do

  create_table "moviegoers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.date "reset_password_sent_at"
    t.date "remember_created_at"
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_moviegoers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_moviegoers_on_reset_password_token", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.text "description"
    t.date "release_date"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_movies_on_title", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "potatoes"
    t.text "comments"
    t.integer "moviegoer_id"
    t.integer "movie_id"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["moviegoer_id"], name: "index_reviews_on_moviegoer_id"
  end

end
