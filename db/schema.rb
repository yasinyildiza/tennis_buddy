# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2015_06_05_151522) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "invited_users", force: :cascade do |t|
    t.integer "inviter_id"
    t.string "email"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "match_sets", force: :cascade do |t|
    t.integer "user_match_id"
    t.integer "home_user_score"
    t.integer "away_user_score"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "rate"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "skill_levels", force: :cascade do |t|
    t.string "name"
    t.integer "minimum_years"
    t.integer "maximum_years"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "tennis_clubs", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.string "phone_number"
    t.text "address"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "tennis_courts", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.string "phone_number"
    t.text "address"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "user_matches", force: :cascade do |t|
    t.integer "home_user_id"
    t.integer "away_user_id"
    t.integer "tennis_court_id"
    t.integer "number_of_sets"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.string "name"
    t.string "surname"
    t.date "birthday"
    t.string "profile_picture"
    t.integer "gender_id"
    t.integer "age"
    t.integer "tennis_club_id"
    t.integer "tennis_court_id"
    t.integer "city_id"
    t.integer "skill_level_id"
    t.text "about_me"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

end
