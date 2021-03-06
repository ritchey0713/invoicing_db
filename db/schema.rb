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

ActiveRecord::Schema.define(version: 2019_07_04_200002) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "work_type"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "hourly_pay_rate"
    t.string "phone_number"
    t.string "website"
  end

  create_table "companies_users", id: false, force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "user_id", null: false
    t.index ["company_id", "user_id"], name: "index_companies_users_on_company_id_and_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "address"
    t.integer "duration"
    t.string "notes"
    t.string "job_type"
    t.string "builder_name"
    t.integer "user_id"
    t.integer "company_id"
    t.integer "category_id"
    t.string "ticketed_work_1"
    t.string "ticketed_work_2"
    t.string "ticketed_work_3"
    t.string "ticketed_work_4"
    t.string "ticketed_work_5"
    t.string "ticketed_work_6"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "phone_number"
    t.string "occupation"
    t.integer "hourly_rate"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
