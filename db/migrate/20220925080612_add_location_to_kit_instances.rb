class AddLocationToKitInstances < ActiveRecord::Migration[7.0]
  def change
    add_reference :kit_instances, :location
  end
end
