class AddGuidToKitInstance < ActiveRecord::Migration[7.0]
  def change
    add_column :kit_instances, :guid, :string
    add_index :kit_instances, :guid, unique: true
  end
end
