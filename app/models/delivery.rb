class Delivery < ActiveRecord::Base

  fields do
    name  :string
    phone :string
    delivery_type  :string
  end
  attr_accessible :name, :phone, :delivery_type

  has_many :menus, dependent: :destroy
  has_many :delivery_calls

  validates :name, presence: true, uniqueness: true
  validates :phone, presence: true
  def to_s
    name
  end
end