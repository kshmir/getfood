class Delivery < ActiveRecord::Base

  fields do
    name  :string
    phone :string
    type  :string
  end
  attr_accessible :name, :phone, :type

  has_many :menus, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :type, presence: true
end
