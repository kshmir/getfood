class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :delivery_requests do |t|
      t.integer :user_id
    end
    add_index :delivery_requests, [:user_id]
  end

  def self.down
    drop_table :delivery_requests
  end
end
