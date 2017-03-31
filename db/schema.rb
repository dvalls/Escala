# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170331201136) do

  create_table "about_translations", force: :cascade do |t|
    t.integer  "about_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
  end

  add_index "about_translations", ["about_id"], name: "index_about_translations_on_about_id"
  add_index "about_translations", ["locale"], name: "index_about_translations_on_locale"

  create_table "abouts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carousel_translations", force: :cascade do |t|
    t.integer  "carousel_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "description"
  end

  add_index "carousel_translations", ["carousel_id"], name: "index_carousel_translations_on_carousel_id"
  add_index "carousel_translations", ["locale"], name: "index_carousel_translations_on_locale"

  create_table "carousels", force: :cascade do |t|
    t.integer "course_id"
    t.string  "title"
    t.string  "description"
    t.string  "image_url"
    t.integer "order"
  end

  add_index "carousels", ["course_id"], name: "index_carousels_on_course_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "shortname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "categories_material_files", force: :cascade do |t|
    t.integer "category_id"
    t.integer "course_id"
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "shortname"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale"

  create_table "contact_translations", force: :cascade do |t|
    t.integer  "contact_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
  end

  add_index "contact_translations", ["contact_id"], name: "index_contact_translations_on_contact_id"
  add_index "contact_translations", ["locale"], name: "index_contact_translations_on_locale"

  create_table "contacts", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_translations", force: :cascade do |t|
    t.integer  "course_id",   null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.text     "body"
  end

  add_index "course_translations", ["course_id"], name: "index_course_translations_on_course_id"
  add_index "course_translations", ["locale"], name: "index_course_translations_on_locale"

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "body"
    t.date     "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "cover_image"
    t.boolean  "publish"
  end

  add_index "courses", ["slug"], name: "index_courses_on_slug", unique: true

  create_table "courses_students", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  add_index "courses_students", ["course_id"], name: "index_courses_students_on_course_id"
  add_index "courses_students", ["student_id"], name: "index_courses_students_on_student_id"

  create_table "feed_translations", force: :cascade do |t|
    t.integer  "feed_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
    t.text     "body"
  end

  add_index "feed_translations", ["feed_id"], name: "index_feed_translations_on_feed_id"
  add_index "feed_translations", ["locale"], name: "index_feed_translations_on_locale"

  create_table "feeds", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "images", force: :cascade do |t|
    t.integer "imageable_id"
    t.string  "imageable_type"
    t.string  "title"
    t.text    "description"
    t.text    "url"
    t.string  "width"
    t.string  "height"
  end

  create_table "material_files", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "my_course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "material_files", ["category_id"], name: "index_material_files_on_category_id"
  add_index "material_files", ["my_course_id"], name: "index_material_files_on_my_course_id"

  create_table "my_courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "username",        limit: 25
    t.string "password_digest", limit: 25
    t.string "name"
    t.string "last_name"
    t.string "gender"
    t.date   "birthday"
    t.string "degree"
    t.string "email"
    t.string "address"
    t.string "address_number"
  end

end
