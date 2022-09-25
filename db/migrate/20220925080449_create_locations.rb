class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps
    end
    add_index :locations, :name, unique: true
    add_index :locations, :slug, unique: true
  end
end
