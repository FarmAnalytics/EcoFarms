# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_26_103939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text "method"
    t.text "score"
    t.text "perspective"
    t.text "interest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "claps", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "farm_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_claps_on_farm_id"
    t.index ["user_id"], name: "index_claps_on_user_id"
  end

  create_table "criterions", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_criterions_on_category_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "address"
    t.text "description"
    t.float "surface"
    t.boolean "private"
    t.integer "employees"
    t.string "cultures"
    t.string "sector"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_farms_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "list_id", null: false
    t.bigint "farm_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_likes_on_farm_id"
    t.index ["list_id"], name: "index_likes_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "shop_id", null: false
    t.boolean "private"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_lists_on_shop_id"
  end

  create_table "scorings", force: :cascade do |t|
    t.bigint "criterion_id", null: false
    t.bigint "farm_id", null: false
    t.integer "score"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["criterion_id"], name: "index_scorings_on_criterion_id"
    t.index ["farm_id"], name: "index_scorings_on_farm_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "claps", "farms"
  add_foreign_key "claps", "users"
  add_foreign_key "criterions", "categories"
  add_foreign_key "farms", "users"
  add_foreign_key "likes", "farms"
  add_foreign_key "likes", "lists"
  add_foreign_key "lists", "shops"
  add_foreign_key "scorings", "criterions"
  add_foreign_key "scorings", "farms"
  add_foreign_key "shops", "users"
end
