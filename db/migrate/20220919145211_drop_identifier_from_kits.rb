class DropIdentifierFromKits < ActiveRecord::Migration[7.0]
  def change
    remove_index :kits, :identifier, unique: true
    remove_column :kits, :identifier, :string
  end
end
