class HoboMigration8 < ActiveRecord::Migration
  def self.up
    add_column :deliveries, :delivery_type, :string
  end

  def self.down
    remove_column :deliveries, :delivery_type
  end
end
