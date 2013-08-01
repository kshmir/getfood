class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :delivery_calls, :calling_user_id, :integer

    add_index :delivery_calls, [:calling_user_id]
  end

  def self.down
    remove_column :delivery_calls, :calling_user_id

    remove_index :delivery_calls, :name => :index_delivery_calls_on_calling_user_id rescue ActiveRecord::StatementInvalid
  end
end
