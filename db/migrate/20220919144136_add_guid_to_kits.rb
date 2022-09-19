class AddGuidToKits < ActiveRecord::Migration[7.0]
  def change
    add_column :kits, :guid, :string
    add_index :kits, :guid, unique: true
  end
end
