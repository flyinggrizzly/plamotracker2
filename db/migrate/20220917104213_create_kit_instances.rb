class CreateKitInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :kit_instances do |t|
      t.references :kit, null: false, foreign_key: true
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
