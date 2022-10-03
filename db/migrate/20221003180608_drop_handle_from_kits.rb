class DropHandleFromKits < ActiveRecord::Migration[7.0]
  def change
    remove_column :kits, :handle, :string, null: false
  end
end
