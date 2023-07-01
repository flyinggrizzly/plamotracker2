class CreateBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 1

      t.index :name, unique: true
      t.timestamps
    end
  end
end
