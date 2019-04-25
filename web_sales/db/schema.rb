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

ActiveRecord::Schema.define(version: 2019_04_25_092440) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "price"
    t.integer "qty"
    t.integer "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "transaction_id"
    t.index ["category_id", "created_at"], name: "index_orders_on_category_id_and_created_at"
    t.index ["category_id"], name: "index_orders_on_category_id"
    t.index ["product_id", "created_at"], name: "index_orders_on_product_id_and_created_at"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["transaction_id", "created_at"], name: "index_orders_on_transaction_id_and_created_at"
    t.index ["transaction_id"], name: "index_orders_on_transaction_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.integer "price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "view"
    t.decimal "rating"
    t.index ["category_id", nil], name: "index_products_on_category_id_and_create_at"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id"
    t.string "status"
    t.integer "amount"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "user_email"
    t.string "user_phone"
    t.string "payment"
    t.string "payment_info"
    t.index ["user_id", nil], name: "index_transactions_on_user_id_and_create_at"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
