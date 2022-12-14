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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_213241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "my_professions", force: :cascade do |t|
    t.bigint "profession_id", null: false
    t.bigint "profile_id", null: false
    t.string "year"
    t.integer "price_hour"
    t.integer "price_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
    t.index ["profession_id"], name: "index_my_professions_on_profession_id"
    t.index ["profile_id"], name: "index_my_professions_on_profile_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.datetime "date", precision: nil
    t.string "description"
    t.string "url_video"
    t.string "transport"
    t.string "address"
    t.boolean "validated"
    t.string "quick_assessment"
    t.boolean "experienced"
    t.boolean "available_48"
    t.string "state"
    t.bigint "profile_id", null: false
    t.bigint "profession_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "carrier"
    t.float "latitude"
    t.float "longitude"
    t.index ["profession_id"], name: "index_posts_on_profession_id"
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "name"
    t.integer "recommended_price"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit"
    t.string "url_photo"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.date "birthday"
    t.string "type_profile"
    t.string "type_professional"
    t.string "country"
    t.string "city"
    t.string "address"
    t.string "personal_number"
    t.integer "score"
    t.integer "number_jobs"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vehicle"
    t.string "phone"
    t.string "email"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_reservations_on_post_id"
    t.index ["profile_id"], name: "index_reservations_on_profile_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "profile_id", null: false
    t.bigint "my_profession_id", null: false
    t.string "description"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_profession_id"], name: "index_reviews_on_my_profession_id"
    t.index ["post_id"], name: "index_reviews_on_post_id"
    t.index ["profile_id"], name: "index_reviews_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "whatsapp"
    t.string "type_profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "my_professions", "professions"
  add_foreign_key "my_professions", "profiles"
  add_foreign_key "posts", "professions"
  add_foreign_key "posts", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "reservations", "posts"
  add_foreign_key "reservations", "profiles"
  add_foreign_key "reviews", "my_professions"
  add_foreign_key "reviews", "posts"
  add_foreign_key "reviews", "profiles"
end
