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

ActiveRecord::Schema.define(version: 20160709031716) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "abilities", ["name"], name: "index_abilities_on_name", unique: true

  create_table "abilities_castes", id: false, force: :cascade do |t|
    t.integer "ability_id", null: false
    t.integer "caste_id",   null: false
  end

  add_index "abilities_castes", ["ability_id", "caste_id"], name: "index_abilities_castes_on_ability_id_and_caste_id", unique: true
  add_index "abilities_castes", ["ability_id"], name: "index_abilities_castes_on_ability_id"
  add_index "abilities_castes", ["caste_id"], name: "index_abilities_castes_on_caste_id"

  create_table "anima_effects", force: :cascade do |t|
    t.string   "condition",  null: false
    t.string   "effect",     null: false
    t.integer  "owner_id",   null: false
    t.string   "owner_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "anima_effects", ["owner_type", "owner_id"], name: "index_anima_effects_on_owner_type_and_owner_id"

  create_table "attribute_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attribute_categories", ["name"], name: "index_attribute_categories_on_name", unique: true

  create_table "attributes", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "attribute_category_id", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "attributes", ["attribute_category_id"], name: "index_attributes_on_attribute_category_id"
  add_index "attributes", ["name"], name: "index_attributes_on_name", unique: true

  create_table "castes", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "character_type_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "castes", ["character_type_id"], name: "index_castes_on_character_type_id"
  add_index "castes", ["name"], name: "index_castes_on_name", unique: true

  create_table "character_abilities", force: :cascade do |t|
    t.integer  "character_id",                 null: false
    t.integer  "ability_id",                   null: false
    t.integer  "value"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "favored",      default: false, null: false
  end

  add_index "character_abilities", ["ability_id"], name: "index_character_abilities_on_ability_id"
  add_index "character_abilities", ["character_id", "ability_id"], name: "index_character_abilities_on_character_id_and_ability_id", unique: true
  add_index "character_abilities", ["character_id"], name: "index_character_abilities_on_character_id"

  create_table "character_attributes", force: :cascade do |t|
    t.integer  "character_id", null: false
    t.integer  "attribute_id", null: false
    t.integer  "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "character_attributes", ["attribute_id"], name: "index_character_attributes_on_attribute_id"
  add_index "character_attributes", ["character_id", "attribute_id"], name: "index_character_attributes_on_character_id_and_attribute_id", unique: true
  add_index "character_attributes", ["character_id"], name: "index_character_attributes_on_character_id"

  create_table "character_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "character_types", ["name"], name: "index_character_types_on_name", unique: true

  create_table "characters", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "concept"
    t.integer  "caste_id",            null: false
    t.integer  "willpower"
    t.integer  "essence"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "player"
    t.string   "anima"
    t.integer  "supernal_ability_id"
  end

  add_index "characters", ["caste_id"], name: "index_characters_on_caste_id"

  create_table "specialties", force: :cascade do |t|
    t.string   "description",          null: false
    t.integer  "character_ability_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "specialties", ["character_ability_id"], name: "index_specialties_on_character_ability_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
