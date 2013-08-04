class Menu < ActiveRecord::Base
  fields do
    price       :float
    description :string
  end
  attr_accessible :price, :description

	has_and_belongs_to_many :delivery_requests
  belongs_to :delivery
  
  validates :price, presence: true
  validates :description, presence: true
  validates :delivery, presence: true
  def to_s
    description
  end
end
