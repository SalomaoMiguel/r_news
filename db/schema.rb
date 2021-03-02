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

ActiveRecord::Schema.define(version: 2021_02_26_171137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "senha", null: false
    t.boolean "ativo", default: true, null: false
    t.boolean "master", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "idioma", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_registro", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nome"
    t.string "email"
    t.string "navegador"
    t.string "so"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_registro_on_user_id"
  end

  add_foreign_key "user_registro", "\"user\"", column: "user_id"
end
