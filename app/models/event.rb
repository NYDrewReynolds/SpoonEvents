class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :start_time, presence: true

  def directions_link
    self.location.sub(' ', '+')
  end

  def readable_date
    self.start_time.strftime("%A, %d %b %Y %l:%M %p")
  end
end
