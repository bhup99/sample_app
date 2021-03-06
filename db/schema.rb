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

ActiveRecord::Schema.define(version: 20140811155959) do

  create_table "attachments", force: true do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["blog_id"], name: "index_attachments_on_blog_id"

  create_table "blogs", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "blogs", ["title"], name: "index_blogs_on_title"
  add_index "blogs", ["user_id", "created_at"], name: "index_blogs_on_user_id_and_created_at"
  add_index "blogs", ["user_id", "title"], name: "index_blogs_on_user_id_and_title", unique: true

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "blog_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id"

  create_table "ratings", force: true do |t|
    t.integer  "blog_id"
    t.integer  "user_id"
    t.integer  "score",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["blog_id"], name: "index_ratings_on_blog_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "replies", force: true do |t|
    t.integer  "replyto_id"
    t.integer  "replycomment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "replies", ["replycomment_id"], name: "index_replies_on_replycomment_id"
  add_index "replies", ["replyto_id", "replycomment_id"], name: "index_replies_on_replyto_id_and_replycomment_id", unique: true
  add_index "replies", ["replyto_id"], name: "index_replies_on_replyto_id"

  create_table "reviews", force: true do |t|
    t.string   "content"
    t.integer  "blog_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["blog_id", "user_id"], name: "index_reviews_on_blog_id_and_user_id", unique: true
  add_index "reviews", ["blog_id"], name: "index_reviews_on_blog_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
