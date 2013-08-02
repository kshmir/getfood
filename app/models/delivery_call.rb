class DeliveryCall < ActiveRecord::Base

  fields do
    delivery_time :datetime
    status        :string, default: 'started' # statuses: 'started', 'pending', 'complete'
  end
  attr_accessible :delivery_time, :calling_user, :delivery_id

  belongs_to :delivery
  has_many :delivery_requests
  has_many :users, through: :delivery_requests
  belongs_to :calling_user, class_name: "User"

  validates :delivery_time, presence: true
  validates :delivery_requests, :length => { :minimum => 1 }
  validates :calling_user_id, presence: true, :if => lambda { |x| x.status == 'pending' }
  validates :delivery, presence: true

  validate :all_users_have_same_company

  scope :today_calls, lambda {
    where("delivery_time >= ? AND delivery_time < ?", Date.today, Date.tomorrow)
  }

  def all_users_have_same_company
    delivery_users = delivery_requests.map(&:user)
    delivery_users << calling_user unless calling_user.nil?
    errors.add(:users, I18n.t("delivery_call_form.all_users_should_have_same_company")) unless delivery_users.all? { |x| delivery_users.first.company == x.company }
  end
end
