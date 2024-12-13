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

ActiveRecord::Schema[8.0].define(version: 0) do
  create_table "groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_group_id"
    t.index ["user_group_id"], name: "groups_user_group_id_idx"
  end

  create_table "messages", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "body"
    t.integer "group_id"
    t.datetime "created_at", precision: nil
    t.integer "updated_at"
    t.integer "user_id"
    t.index ["group_id"], name: "messages_group_id_idx"
    t.index ["user_id"], name: "messages_user_id_idx"
  end

  create_table "user_groups", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "created_at"
    t.integer "updated_at"
    t.integer "user_id"
    t.integer "group_id"
    t.index ["group_id"], name: "user_groups_group_id_idx"
    t.index ["user_id"], name: "user_groups_user_id_idx"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "encrypted_password"
    t.integer "created_at"
    t.integer "updated_at"
    t.integer "user_group_id"
    t.index ["user_group_id"], name: "users_user_group_id_idx"
  end

  add_foreign_key "groups", "user_groups", name: "groups_user_group_id"
  add_foreign_key "messages", "groups", name: "messages_group_id"
  add_foreign_key "messages", "users", name: "messages_user_id"
  add_foreign_key "user_groups", "groups", name: "user_groups_group_id"
  add_foreign_key "user_groups", "users", name: "user_groups_user_id"
  add_foreign_key "users", "user_groups", name: "users_user_group_id"
end
