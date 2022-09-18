class BackfillKitLinks < ActiveRecord::Migration[7.0]
  def change
    Kit.all.each do |kit|
      next unless kit.base_kit.present?

      kit.kit_links << kit.base_kit
    end
  end
end
