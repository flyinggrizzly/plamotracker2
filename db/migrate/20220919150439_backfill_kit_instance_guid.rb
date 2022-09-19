class BackfillKitInstanceGuid < ActiveRecord::Migration[7.0]
  def change
    KitInstance.all.each do |ki|
      ki.fill_guid!
    end
  end
end
