class DeliveryRequest < ActiveRecord::Base
	fields do end
	has_many :menus
	belongs_to :user
	belongs_to :delivery_call

	attr_accessible :menus, :user, :delivery_call
end
