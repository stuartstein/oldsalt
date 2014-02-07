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

ActiveRecord::Schema.define(version: 20140207011709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: true do |t|
    t.integer  "member_id"
    t.integer  "event_id"
    t.string   "rsvp",        default: "Waiting"
    t.boolean  "is_lead"
    t.datetime "last_viewed"
    t.integer  "guests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id", using: :btree
  add_index "attendees", ["member_id"], name: "index_attendees_on_member_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "picture"
    t.string   "invite_line"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "capacity"
    t.float    "price"
    t.float    "oldsalt_fee"
    t.string   "location_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "map_url"
    t.text     "attire"
    t.text     "what_to_bring"
    t.text     "notes"
    t.text     "warnings"
    t.string   "clue_url"
    t.text     "clue_text"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "role"
    t.boolean  "active"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "expiration"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       default: 0
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["invitation_token"], name: "index_members_on_invitation_token", unique: true, using: :btree
  add_index "members", ["invitations_count"], name: "index_members_on_invitations_count", using: :btree
  add_index "members", ["invited_by_id"], name: "index_members_on_invited_by_id", using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.float    "price"
    t.string   "item_weight"
    t.string   "shipping_locations"
    t.string   "delivery_time"
    t.float    "shipping_price"
    t.string   "return_policy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
