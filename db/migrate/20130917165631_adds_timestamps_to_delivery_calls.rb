class AddsTimestampsToDeliveryCalls < ActiveRecord::Migration
  def self.up
    add_column :delivery_calls, :created_at, :datetime
    add_column :delivery_calls, :updated_at, :datetime
  end

  def self.down
    remove_column :delivery_calls, :created_at
    remove_column :delivery_calls, :updated_at
  end
end
