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

ActiveRecord::Schema[8.0].define(version: 2024_11_25_145422) do
  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_comments_on_lesson_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "course_lessons", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "lesson_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_lessons_on_course_id"
    t.index ["lesson_id"], name: "index_course_lessons_on_lesson_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.string "difficulty"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "enrolments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrolments_on_course_id"
    t.index ["user_id"], name: "index_enrolments_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "comments", "lessons"
  add_foreign_key "comments", "users"
  add_foreign_key "course_lessons", "courses"
  add_foreign_key "course_lessons", "lessons"
  add_foreign_key "courses", "users"
  add_foreign_key "enrolments", "courses"
  add_foreign_key "enrolments", "users"
  add_foreign_key "lessons", "courses"
end
