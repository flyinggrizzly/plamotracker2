class BackfillHandleOnKits < ActiveRecord::Migration[7.0]
  def change
    Kit.all.each do |kit|
      kit.validate
      kit.save
    end
  end
end
