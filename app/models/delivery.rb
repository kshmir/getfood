class Delivery < ActiveRecord::Base

  fields do
    name  :string
    phone :string
    type  :string
  end
  attr_accessible :name, :phone, :type

  has_many :menues, dependent: :destroy
end
