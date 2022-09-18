class AddHandleToKits < ActiveRecord::Migration[7.0]
  def change
    add_column :kits, :handle, :string
  end
end
