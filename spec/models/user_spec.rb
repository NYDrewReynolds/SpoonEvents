require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(name: "Drew Reynolds", email: 'drew@spoon.com', password: 'password')
  end

  it "is valid with all parameters" do
    expect(@user).to be_valid
  end
  it "is invalid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without an email" do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without a unique email" do
    @user_one = User.create(name:"Tom Reynolds", email: "tom@spoon.com", password: 'password')
    @user_two = User.create(name:"Tom Ryan", email: "tom@spoon.com", password: 'password')

    expect(@user_one).to be_valid
    expect(@user_two).to_not be_valid
  end
end
