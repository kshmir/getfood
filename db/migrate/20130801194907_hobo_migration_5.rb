class HoboMigration5 < ActiveRecord::Migration
  def self.up
    change_column :delivery_calls, :status, :string, :limit => 255, :default => "started"
  end

  def self.down
    change_column :delivery_calls, :status, :string
  end
end
