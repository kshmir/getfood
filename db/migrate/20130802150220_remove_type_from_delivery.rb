class RemoveTypeFromDelivery < ActiveRecord::Migration
  def up
  	remove_column :deliveries, :type, :string
  end

  def down
  end
end
