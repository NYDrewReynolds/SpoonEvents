class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :registrations
  has_many :events, through: :registrations
end
