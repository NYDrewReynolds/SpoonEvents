class Event < ActiveRecord::Base
  require'open-uri'
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

  def share_text
    URI::encode("I'm going to #{name}! Meet me there? https://spoon-events.herokuapp.com/events/#{id}")
  end

end
