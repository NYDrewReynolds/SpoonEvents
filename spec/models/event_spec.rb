require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with all parameters" do
    @event = Event.create(name: "Test Event", location: '45 Narwood Rd. Massapequa, NY 11758', start_time: 'Tue, 08 Mar 2016 14:30:00 UTC +00:00')
    expect(@event).to be_valid
  end
  it "is invalid without a name" do
    @event = Event.create(location: '45 Narwood Rd. Massapequa, NY 11758', start_time: 'Tue, 08 Mar 2016 14:30:00 UTC +00:00')
    expect(@event).to_not be_valid
  end

  it "is invalid without a location" do
    @event = Event.create(name: "Test Event", start_time: 'Tue, 08 Mar 2016 14:30:00 UTC +00:00')
    expect(@event).to_not be_valid
  end

  it 'is invalid without a start time' do
    @event = Event.create(name: "Test Event", location: '45 Narwood Rd. Massapequa, NY 11758')
    expect(@event).to_not be_valid
  end
end
