class RemoveKitInstanceFieldsFromKit < ActiveRecord::Migration[7.0]
  def change
    remove_column :kits, :status, :integer, default: 100
    remove_column :kits, :quantity, :integer
  end
end
