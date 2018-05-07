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

ActiveRecord::Schema.define(version: 20180412175634) do

  create_table "about_translations", force: :cascade do |t|
    t.integer  "about_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
    t.index ["about_id"], name: "index_about_translations_on_about_id"
    t.index ["locale"], name: "index_about_translations_on_locale"
  end

  create_table "abouts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carousel_translations", force: :cascade do |t|
    t.integer  "carousel_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "description"
    t.index ["carousel_id"], name: "index_carousel_translations_on_carousel_id"
    t.index ["locale"], name: "index_carousel_translations_on_locale"
  end

  create_table "carousels", force: :cascade do |t|
    t.integer "course_id"
    t.string  "title"
    t.string  "description"
    t.string  "image_url"
    t.integer "order"
    t.index ["course_id"], name: "index_carousels_on_course_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "categories_content_library_groups", force: :cascade do |t|
    t.integer "content_library_group_id"
    t.integer "category_id"
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "shortname"
    t.index ["category_id"], name: "index_category_translations_on_category_id"
    t.index ["locale"], name: "index_category_translations_on_locale"
  end

  create_table "contact_translations", force: :cascade do |t|
    t.integer  "contact_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
    t.index ["contact_id"], name: "index_contact_translations_on_contact_id"
    t.index ["locale"], name: "index_contact_translations_on_locale"
  end

  create_table "contacts", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_blocks", force: :cascade do |t|
    t.integer "page_id"
    t.integer "order"
    t.integer "contentable_id"
    t.string  "contentable_type"
    t.index ["page_id"], name: "index_content_blocks_on_page_id"
  end

  create_table "content_docs_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "course_id"
    t.index ["course_id"], name: "index_content_docs_groups_on_course_id"
  end

  create_table "content_docs_groups_docs", force: :cascade do |t|
    t.integer "doc_id"
    t.integer "content_docs_group_id"
  end

  create_table "content_library_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "category_id"
    t.integer "course_id"
    t.index ["category_id"], name: "index_content_library_groups_on_category_id"
  end

  create_table "content_links", force: :cascade do |t|
    t.integer "course_id"
    t.string  "name"
    t.string  "link"
    t.string  "description"
  end

  create_table "content_video_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "course_id"
  end

  create_table "content_video_groups_videos", force: :cascade do |t|
    t.integer "content_video_id"
    t.integer "content_video_group_id"
  end

  create_table "content_videos", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "course_translations", force: :cascade do |t|
    t.integer  "course_id",   null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
    t.text     "body"
    t.index ["course_id"], name: "index_course_translations_on_course_id"
    t.index ["locale"], name: "index_course_translations_on_locale"
  end

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
    t.boolean  "online",      default: false
    t.index ["slug"], name: "index_courses_on_slug", unique: true
  end

  create_table "courses_students", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.index ["course_id"], name: "index_courses_students_on_course_id"
    t.index ["student_id"], name: "index_courses_students_on_student_id"
  end

  create_table "docs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "images", force: :cascade do |t|
    t.integer "imageable_id"
    t.string  "imageable_type"
    t.string  "title"
    t.text    "description"
    t.text    "url"
    t.string  "width"
    t.string  "height"
  end

  create_table "library_files", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "url"
    t.index ["category_id"], name: "index_library_files_on_category_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string  "name"
    t.integer "course_id"
    t.integer "content_block_id"
    t.index ["course_id"], name: "index_pages_on_course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "username",        limit: 25
    t.text   "password_digest"
    t.string "name"
    t.string "last_name"
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

end
