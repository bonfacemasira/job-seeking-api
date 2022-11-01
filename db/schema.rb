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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_085821) do
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

  create_table "employers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "phone_number"
    t.string "organization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employers_on_user_id"
  end

  create_table "job_seekers", force: :cascade do |t|
    t.string "full_name"
    t.integer "salary_expectation"
    t.boolean "availability"
    t.string "country"
    t.text "experience"
    t.string "job_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "skills"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "employer_id", null: false
    t.bigint "job_seeker_id", null: false
    t.bigint "user_id", null: false
    t.string "profile_picture"
    t.string "email"
    t.string "phone_number"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_offers_on_employer_id"
    t.index ["job_seeker_id"], name: "index_offers_on_job_seeker_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "employer_id", null: false
    t.integer "amount"
    t.string "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_payments_on_employer_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "employer_id"
    t.integer "job_seeker_id"
    t.string "full_name"
    t.string "email"
    t.integer "phone_number"
    t.text "bio"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.integer "role", default: 0
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "employers", "users"
  add_foreign_key "offers", "employers"
  add_foreign_key "offers", "job_seekers"
  add_foreign_key "offers", "users"
  add_foreign_key "payments", "employers"
end
