require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = @user = User.create(name: "Drew Reynolds", email: 'drew@spoon.com', password: 'password')
    @event = Event.create(user_id: @user.id, name: "Test Event", location: '45 Narwood Rd. Massapequa, NY 11758', start_time: 'Tue, 08 Mar 2016 14:30:00 UTC +00:00')
  end

  it "is valid with all parameters" do
    expect(@event).to be_valid
  end

  it "is invalid without a name" do
    @event.name = nil
    expect(@event).to_not be_valid
  end

  it "is invalid without a location" do
    @event.location = nil
    expect(@event).to_not be_valid
  end

  it "is invalid without an owner" do
    @event.user_id = nil
    expect(@event).to_not be_valid
  end

  it "can be assigned an owner" do
    expect(@user.id).to be(@event.owner.id)
  end

  it 'is invalid without a start time' do
    @event.start_time = nil
    expect(@event).to_not be_valid
  end

  it "includes name in share link" do
    link = @event.share_text
    expect(link).to include("Test%20Event")
  end
end
