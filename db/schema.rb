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

ActiveRecord::Schema[7.0].define(version: 2022_09_18_203419) do
  create_table "designers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_designers_on_name"
  end

  create_table "designers_kits", id: false, force: :cascade do |t|
    t.integer "kit_id", null: false
    t.integer "designer_id", null: false
  end

  create_table "kit_instances", force: :cascade do |t|
    t.integer "kit_id", null: false
    t.text "notes"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kit_id"], name: "index_kit_instances_on_kit_id"
  end

  create_table "kit_lines", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname", null: false
    t.string "slug", null: false
    t.integer "producer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_kit_lines_on_name", unique: true
    t.index ["producer_id"], name: "index_kit_lines_on_producer_id"
    t.index ["slug"], name: "index_kit_lines_on_slug", unique: true
  end

  create_table "kit_lines_kits", force: :cascade do |t|
    t.integer "kit_id", null: false
    t.integer "kit_line_id", null: false
    t.index ["kit_id"], name: "index_kit_lines_kits_on_kit_id"
    t.index ["kit_line_id"], name: "index_kit_lines_kits_on_kit_line_id"
  end

  create_table "kit_links", force: :cascade do |t|
    t.integer "kit_linked_from_id"
    t.integer "kit_linked_to_id"
    t.index ["kit_linked_from_id", "kit_linked_to_id"], name: "index_kit_links_on_kit_linked_from_id_and_kit_linked_to_id", unique: true
    t.index ["kit_linked_to_id", "kit_linked_from_id"], name: "index_kit_links_on_kit_linked_to_id_and_kit_linked_from_id", unique: true
  end

  create_table "kit_scales", force: :cascade do |t|
    t.integer "denominator"
    t.string "name", null: false
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["denominator"], name: "index_kit_scales_on_denominator", unique: true
    t.index ["name"], name: "index_kit_scales_on_name", unique: true
  end

  create_table "kits", force: :cascade do |t|
    t.string "name", null: false
    t.string "identifier", null: false
    t.integer "kit_scale_id", default: -1, null: false
    t.text "notes"
    t.integer "base_kit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "handle", null: false
    t.index ["base_kit_id"], name: "index_kits_on_base_kit_id"
    t.index ["identifier"], name: "index_kits_on_identifier", unique: true
  end

  create_table "kits_materials", id: false, force: :cascade do |t|
    t.integer "kit_id", null: false
    t.integer "material_id", null: false
  end

  create_table "kits_producers", id: false, force: :cascade do |t|
    t.integer "kit_id", null: false
    t.integer "producer_id", null: false
  end

  create_table "kits_source_materials", id: false, force: :cascade do |t|
    t.integer "kit_id", null: false
    t.integer "source_material_id", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_materials_on_name", unique: true
  end

  create_table "producers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_producers_on_name"
  end

  create_table "source_materials", force: :cascade do |t|
    t.string "name", null: false
    t.string "base_slug", null: false
    t.string "slug", null: false
    t.integer "parent_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_source_id"], name: "index_source_materials_on_parent_source_id"
    t.index ["slug"], name: "index_source_materials_on_slug", unique: true
  end

  add_foreign_key "kit_instances", "kits"
  add_foreign_key "kits", "kit_scales"
  add_foreign_key "kits", "kits", column: "base_kit_id"
  add_foreign_key "source_materials", "source_materials", column: "parent_source_id"
end
