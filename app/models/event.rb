class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :start_time, presence: true

  def directions_link
    format_link = self.location.sub(' ', '+')
  end

end
