class CreateTables < ActiveRecord::Migration[7.0]
  def change
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

    create_table "kit_lines", force: :cascade do |t|
      t.string "name", null: false
      t.string "nickname"
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
      t.integer "status", default: 100, null: false
      t.integer "quantity", default: 1, null: false
      t.integer "base_kit_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["identifier"], name: "index_kits_on_identifier", unique: true
      t.index ["base_kit_id"], name: "index_kits_on_base_kit_id"
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
      t.index ["slug"], name: "index_source_materials_on_slug", unique: true
      t.index ["parent_source_id"], name: "index_source_materials_on_parent_source_id"
    end

    add_foreign_key "kits", "kit_scales"
    add_foreign_key "kits", "kits", column: "base_kit_id"
    add_foreign_key "source_materials", "source_materials", column: "parent_source_id"
  end
end
