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

ActiveRecord::Schema.define(version: 2020_12_13_084020) do

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "credit_card_id", null: false
    t.string "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "comment", null: false
    t.integer "check"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "commenter_id"
    t.integer "reply_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "text"
    t.string "image"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_contents_on_profile_id"
  end

  create_table "event_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_profile_id"
    t.string "src"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_profile_id"], name: "index_event_images_on_event_profile_id"
  end

  create_table "event_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title", null: false
    t.text "explanation"
    t.string "prefecture"
    t.string "city"
    t.string "prace"
    t.datetime "start"
    t.datetime "end"
    t.string "profile_link"
    t.string "store_link"
    t.string "item_link"
    t.string "service_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "priority_number"
    t.index ["priority_number"], name: "index_event_profiles_on_priority_number", unique: true
    t.index ["user_id"], name: "index_event_profiles_on_user_id"
  end

  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "genre_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_genre_profiles_on_genre_id"
    t.index ["profile_id"], name: "index_genre_profiles_on_profile_id"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "src"
    t.string "title"
    t.text "caption"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_images_on_profile_id"
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_profile_id"
    t.string "src"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_profile_id"], name: "index_item_images_on_item_profile_id"
  end

  create_table "item_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.text "explanation"
    t.string "profile_link"
    t.string "store_link"
    t.string "service_link"
    t.string "event_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "priority_number"
    t.index ["priority_number"], name: "index_item_profiles_on_priority_number", unique: true
    t.index ["user_id"], name: "index_item_profiles_on_user_id"
  end

  create_table "profile_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_profile_tags_on_profile_id"
    t.index ["tag_id"], name: "index_profile_tags_on_tag_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "family_name", null: false
    t.string "first_name_kana", null: false
    t.string "family_name_kana", null: false
    t.string "city", null: false
    t.integer "post_code", null: false
    t.string "address_number", null: false
    t.string "building"
    t.bigint "user_id"
    t.integer "prefecture_id"
    t.string "primary_school"
    t.string "Junior_high_school"
    t.string "high_school"
    t.string "vocational_school"
    t.string "university"
    t.string "graduate_school"
    t.string "other_school"
    t.string "first_career"
    t.string "second_career"
    t.string "third_career"
    t.string "fourth_career"
    t.string "last_career"
    t.text "introduction"
    t.date "birth_date", null: false
    t.string "avatar"
    t.string "phone"
    t.string "image"
    t.string "hp"
    t.string "facebook"
    t.string "twitter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
    t.string "sub_image"
    t.string "catch_copy"
    t.string "avatar_title"
    t.string "avatar_catch_copy"
    t.text "avatar_about"
    t.integer "pv_count", null: false
    t.string "password_digest"
    t.string "store_name"
    t.text "store_explanation"
    t.string "store_image"
    t.string "item_name"
    t.text "item_explanation"
    t.string "item_image"
    t.string "service_name"
    t.text "service_explanation"
    t.string "service_image"
    t.string "event_name"
    t.text "event_explanation"
    t.string "event_image"
    t.string "event_place"
    t.datetime "event_start"
    t.datetime "event_end"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "prs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "src"
    t.string "pr_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "service_profile_id"
    t.string "src"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_profile_id"], name: "index_service_images_on_service_profile_id"
  end

  create_table "service_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.text "explanation"
    t.string "profile_link"
    t.string "store_link"
    t.string "item_link"
    t.string "event_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "priority_number"
    t.index ["priority_number"], name: "index_service_profiles_on_priority_number", unique: true
    t.index ["user_id"], name: "index_service_profiles_on_user_id"
  end

  create_table "store_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "store_profile_id"
    t.string "src"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_profile_id"], name: "index_store_images_on_store_profile_id"
  end

  create_table "store_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.text "explanation"
    t.string "profile_link"
    t.string "item_link"
    t.string "service_link"
    t.string "event_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "priority_number"
    t.index ["priority_number"], name: "index_store_profiles_on_priority_number", unique: true
    t.index ["user_id"], name: "index_store_profiles_on_user_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "contents", "profiles"
  add_foreign_key "event_images", "event_profiles"
  add_foreign_key "event_profiles", "users"
  add_foreign_key "follows", "users"
  add_foreign_key "genre_profiles", "genres"
  add_foreign_key "genre_profiles", "profiles"
  add_foreign_key "item_images", "item_profiles"
  add_foreign_key "item_profiles", "users"
  add_foreign_key "profile_tags", "profiles"
  add_foreign_key "profile_tags", "tags"
  add_foreign_key "profiles", "users"
  add_foreign_key "service_images", "service_profiles"
  add_foreign_key "service_profiles", "users"
  add_foreign_key "store_images", "store_profiles"
  add_foreign_key "store_profiles", "users"
end
