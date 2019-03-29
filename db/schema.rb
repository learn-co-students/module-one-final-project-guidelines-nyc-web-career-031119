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

ActiveRecord::Schema.define(version: 20190326193300) do

  create_table "animals", force: :cascade do |t|
    t.string  "species"
    t.string  "name"
    t.integer "birth_year"
    t.string  "size"
    t.string  "gender"
    t.boolean "spayed_neutered"
  end

  create_table "fosterings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "animal_id"
    t.string  "length_of_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
