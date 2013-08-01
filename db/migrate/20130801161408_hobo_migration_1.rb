class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :email, :null => false, :default => ""
      t.string   :encrypted_password, :null => false, :default => ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.integer  :company_id
    end
    add_index :users, [:company_id]

    create_table :companies do |t|
      t.string :name
    end

    create_table :deliveries do |t|
      t.string :name
      t.string :phone
      t.string :type
    end

    create_table :delivery_calls do |t|
      t.datetime :delivery_time
      t.integer  :delivery_id
    end
    add_index :delivery_calls, [:delivery_id]

    create_table :menus do |t|
      t.float   :price
      t.string  :description
      t.integer :delivery_id
    end
    add_index :menus, [:delivery_id]
  end

  def self.down
    drop_table :users
    drop_table :companies
    drop_table :deliveries
    drop_table :delivery_calls
    drop_table :menus
  end
end
