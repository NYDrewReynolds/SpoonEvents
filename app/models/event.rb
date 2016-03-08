class Event < ActiveRecord::Base
  validates :name, :location, :start_time, :user_id, presence: true

  has_many :registrations
  has_many :users, through: :registrations

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  def directions_link
    location.sub(' ', '+')
  end

  def date
    start_time.strftime("%a, %B %e %Y")
  end

  def time
    start_time.strftime("%I:%M %p")
  end

  def create_registration(user)
    registrations.create(user_id: user.id)
  end

end
