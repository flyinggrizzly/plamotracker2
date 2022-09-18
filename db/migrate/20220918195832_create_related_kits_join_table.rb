class CreateRelatedKitsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :kit_links do |t|
      t.integer :kit_linked_from_id
      t.integer :kit_linked_to_id

      t.index [:kit_linked_from_id, :kit_linked_to_id], unique: true
      t.index [:kit_linked_to_id, :kit_linked_from_id], unique: true
    end
  end
end
