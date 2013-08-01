class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :delivery_requests, :delivery_call_id, :integer

    add_index :delivery_requests, [:delivery_call_id]
  end

  def self.down
    remove_column :delivery_requests, :delivery_call_id

    remove_index :delivery_requests, :name => :index_delivery_requests_on_delivery_call_id rescue ActiveRecord::StatementInvalid
  end
end
