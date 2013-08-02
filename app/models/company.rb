class Company < ActiveRecord::Base

  fields do
    name :string
  end

  attr_accessible :name
  has_many :users, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
