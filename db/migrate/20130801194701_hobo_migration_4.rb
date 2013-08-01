class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :delivery_calls, :status, :string
  end

  def self.down
    remove_column :delivery_calls, :status
  end
end
