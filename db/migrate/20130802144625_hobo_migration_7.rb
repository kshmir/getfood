class HoboMigration7 < ActiveRecord::Migration
  def self.up
    create_table :delivery_requests_menus, :id => false do |t|
      t.integer :delivery_request_id
      t.integer :menu_id
    end
  end

  def self.down
    drop_table :delivery_requests_menus
  end
end
