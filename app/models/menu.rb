class Menu < ActiveRecord::Base
  fields do
    price       :float
    description :string
  end
  attr_accessible :price, :description

  belongs_to :delivery
  
  validates :price, presence: true
  validates :description, presence: true
end
