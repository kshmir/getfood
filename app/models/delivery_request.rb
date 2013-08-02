class DeliveryRequest < ActiveRecord::Base
	fields do end
	has_and_belongs_to_many :menus
	belongs_to :user
	belongs_to :delivery_call

	attr_accessible :menus, :user
end
