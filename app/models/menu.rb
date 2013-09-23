class Menu < ActiveRecord::Base
  fields do
    price       :float
    description :string
  end
  attr_accessible :price, :description, :delivery_id

	has_and_belongs_to_many :delivery_requests
  belongs_to :delivery
  
  validates :price, presence: true
  validates :description, presence: true
  validates :delivery_id, presence: true
  def to_s
    description
  end
end
