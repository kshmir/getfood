class DeliveryCall < ActiveRecord::Base

  fields do
    delivery_time :datetime
  end
  attr_accessible :delivery_time

  belongs_to :delivery
  has_many :delivery_requests
  has_many :users, through: :delivery_requests
  has_one :calling_user, class_name: "User"
end
