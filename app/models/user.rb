class User < ActiveRecord::Base
  fields do
    email :string,              :null => false, :default => ""
    encrypted_password :string, :null => false, :default => ""
    ## Recoverable
    reset_password_token :string
    reset_password_sent_at :datetime
    ## Rememberable
    remember_created_at :datetime
    ## Trackable
    sign_in_count :integer, :default => 0
    current_sign_in_at :datetime
    last_sign_in_at :datetime
    current_sign_in_ip :string  
    last_sign_in_ip :string  
  end
  attr_accessible :email, :password, :remember_me
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body
  belongs_to :company
  has_many :delivery_requests
  has_many :delivery_calls, through: :delivery_requests
end
