class MakeKitGuidRequired < ActiveRecord::Migration[7.0]
  def change
    change_column :kits, :guid, :string, null: false
  end
end
