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

ActiveRecord::Schema.define(version: 20190108212053) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.text "ability_type"
    t.integer "card_id"
  end

  create_table "attacks", force: :cascade do |t|
    t.string "cost"
    t.string "name"
    t.text "text"
    t.string "damage"
    t.integer "card_id"
  end

  create_table "card_sets", force: :cascade do |t|
    t.string "name"
    t.integer "series_id"
    t.string "release_date"
    t.string "symbol_image_url"
    t.string "logo_image_url"
    t.integer "total_cards"
    t.string "set_api_name"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "hd_image_url"
    t.string "hp"
    t.string "energy_types"
    t.string "card_number"
    t.string "sub_type"
    t.string "super_type"
    t.string "flavor_text"
    t.integer "evloves_from_id"
    t.integer "evolves_to_id"
    t.integer "retreat_cost"
    t.string "artist"
    t.integer "set_id"
    t.string "rarity"
    t.string "weakness"
    t.string "resistance"
    t.string "api_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.string "logo_image_url"
  end

  create_table "user_cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "card_id"
    t.integer "quantity"
    t.integer "foil_quantity"
    t.index ["card_id"], name: "index_user_cards_on_card_id"
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
