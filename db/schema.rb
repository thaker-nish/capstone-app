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

ActiveRecord::Schema.define(version: 20170122180339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "club_locations", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "club_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "club_promoters", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "promoter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.text     "url"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "promoter_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "promoter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["promoter_id"], name: "index_conversations_on_promoter_id", using: :btree
    t.index ["user_id"], name: "index_conversations_on_user_id", using: :btree
  end

  create_table "guestlists", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "promoter_id"
    t.integer  "user_id"
    t.integer  "promotion_id"
    t.integer  "guests"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "reservation_date"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "promoter_id"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "url"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.integer  "promoter_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "promoter_followers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "promoter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "promoter_messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "promoter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "promoters", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "club_name"
    t.integer  "promoter_id"
  end

  create_table "user_messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
