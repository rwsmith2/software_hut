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

ActiveRecord::Schema.define(version: 2021_04_21_123258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", primary_key: "vendor_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "house_name", null: false
    t.string "city_town", null: false
    t.string "country", null: false
    t.string "postcode", null: false
  end

  create_table "admins", primary_key: "admin_id", id: :serial, force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "answers", primary_key: "answer_id", id: :serial, force: :cascade do |t|
    t.string "answer_text", null: false
    t.string "additional_response"
    t.integer "question_id"
  end

  create_table "assessment_linkers", force: :cascade do |t|
    t.integer "task_id"
    t.integer "assessment_id"
  end

  create_table "assessments", primary_key: "assessment_id", id: :serial, force: :cascade do |t|
    t.string "assessment_title", null: false
  end

  create_table "assignments", primary_key: "assignment_id", id: :serial, force: :cascade do |t|
    t.boolean "complete", default: false
    t.integer "vendor_id", null: false
    t.integer "given_task_id", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "given_tasks", primary_key: "given_task_id", id: :serial, force: :cascade do |t|
    t.date "set_date", null: false
    t.date "due_date", null: false
    t.integer "priority"
    t.integer "repeatable", null: false
    t.bigint "task_id"
    t.index ["task_id"], name: "index_given_tasks_on_task_id"
  end

  create_table "questions", primary_key: "question_id", id: :serial, force: :cascade do |t|
    t.string "question_text", null: false
    t.integer "assessment_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "tasks", primary_key: "task_id", id: :serial, force: :cascade do |t|
    t.string "task_title", null: false
    t.string "task_description"
    t.integer "estimation", null: false
    t.integer "user_id"
  end

  create_table "uploads", primary_key: "upload_id", id: :serial, force: :cascade do |t|
    t.integer "upload_type"
    t.string "upload_description"
    t.integer "answer_id"
  end

  create_table "users", primary_key: "user_id", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_name", null: false
    t.boolean "accepted", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendor_answers", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "assignment_id"
  end

  create_table "vendor_uploads", force: :cascade do |t|
    t.integer "upload_id"
    t.binary "data"
    t.integer "assignment_id"
  end

  create_table "vendors", primary_key: "vendor_id", id: :serial, force: :cascade do |t|
    t.string "company_name", null: false
    t.integer "company_number", null: false
    t.boolean "validated", default: false
    t.integer "initial_score"
    t.integer "credit_rating"
    t.integer "kpi"
    t.integer "risk_rating"
    t.integer "user_id"
  end

  add_foreign_key "addresses", "vendors", primary_key: "vendor_id", on_delete: :cascade
  add_foreign_key "admins", "users", primary_key: "user_id", on_delete: :cascade
  add_foreign_key "answers", "questions", primary_key: "question_id", on_delete: :cascade
  add_foreign_key "assessment_linkers", "assessments", primary_key: "assessment_id", on_delete: :cascade
  add_foreign_key "assessment_linkers", "tasks", primary_key: "task_id"
  add_foreign_key "assignments", "given_tasks", primary_key: "given_task_id", on_delete: :cascade
  add_foreign_key "assignments", "vendors", primary_key: "vendor_id", on_delete: :cascade
  add_foreign_key "questions", "assessments", primary_key: "assessment_id"
  add_foreign_key "tasks", "users", primary_key: "user_id"
  add_foreign_key "uploads", "answers", primary_key: "answer_id", on_delete: :cascade
  add_foreign_key "vendor_answers", "answers", primary_key: "answer_id"
  add_foreign_key "vendor_answers", "assignments", primary_key: "assignment_id", on_delete: :cascade
  add_foreign_key "vendor_uploads", "assignments", primary_key: "assignment_id", on_delete: :cascade
  add_foreign_key "vendor_uploads", "uploads", primary_key: "upload_id"
  add_foreign_key "vendors", "users", primary_key: "user_id", on_delete: :cascade
end
