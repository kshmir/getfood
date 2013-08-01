class DeliveryRequest < ActiveRecord::Base
	has_many :menues
	has_one :user 
end
