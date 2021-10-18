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

ActiveRecord::Schema.define(version: 2021_10_17_232627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.integer "critical_level"
    t.boolean "is_internal"
    t.string "business_alias"
    t.string "repository_url"
    t.string "app_tags"
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_tags"], name: "index_apps_on_app_tags"
    t.index ["owner_id"], name: "index_apps_on_owner_id"
  end

  create_table "cloud_resources", force: :cascade do |t|
    t.string "resource_name"
    t.string "resource_id"
    t.string "resource_type"
    t.string "resource_creation_time"
    t.integer "cloud_provider"
    t.string "cloud_provider_id"
    t.string "aws_arn"
    t.jsonb "relationships"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "tag_compliant"
    t.datetime "deleted_at"
    t.string "created_by"
  end

  create_table "cloud_stack_compliances", id: :bigint, default: -> { "nextval('cloud_stack_compliences_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "cloud_stack_id", null: false
    t.bigint "compliance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cloud_stack_id"], name: "index_cloud_stack_compliences_on_cloud_stack_id"
    t.index ["compliance_id"], name: "index_cloud_stack_compliences_on_complience_id"
  end

  create_table "cloud_stacks", force: :cascade do |t|
    t.integer "cloud_provider"
    t.string "cloud_provider_id"
    t.float "sla"
    t.float "score"
    t.integer "status"
    t.bigint "app_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["app_id"], name: "index_cloud_stacks_on_app_id"
    t.index ["name"], name: "index_cloud_stacks_on_name"
  end

  create_table "compliances", id: :bigint, default: -> { "nextval('compliences_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "rule_name"
    t.float "weight"
    t.datetime "deadline"
    t.boolean "required_by_law"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apps", "owners"
  add_foreign_key "cloud_stack_compliances", "cloud_stacks"
  add_foreign_key "cloud_stack_compliances", "compliances"
  add_foreign_key "cloud_stacks", "apps"
end
