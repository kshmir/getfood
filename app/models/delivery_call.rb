class DeliveryCall < ActiveRecord::Base

  fields do
    delivery_time :datetime
    status        :string, default: 'started' # statuses: 'started', 'pending', 'complete'
  end
  attr_accessible :delivery_time, :calling_user

  belongs_to :delivery
  has_many :delivery_requests
  has_many :users, through: :delivery_requests
  belongs_to :calling_user, class_name: "User"

  validates :delivery_time, presence: true
  validates :delivery_requests, :length => { :minimum => 1 }
  validates :calling_user_id, presence: true, :if => lambda { |x| x.status == 'pending' }

  validate :all_users_have_same_company

  def all_users_have_same_company
    users = delivery_requests.map(&:user)
    users << calling_user unless calling_user.nil?
    errors.add(:users, I18n.t("delivery_call_form.all_users_should_have_same_company")) unless users.all? { |x| users.first.company == x.company }
  end
end
