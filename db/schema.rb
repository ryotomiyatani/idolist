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

ActiveRecord::Schema.define(version: 20180319044202) do

  create_table "administrators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "idols", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "idol_name"
    t.string   "idol_content"
    t.string   "idol_url"
    t.string   "idol_image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "thoughts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "idol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idol_id"], name: "index_thoughts_on_idol_id", using: :btree
    t.index ["user_id", "idol_id", "type"], name: "index_thoughts_on_user_id_and_idol_id_and_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_thoughts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "thoughts", "idols"
  add_foreign_key "thoughts", "users"
end
