require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with all parameters" do
    @user = User.create(name: "Drew Reynolds", email: 'drew@spoon.com')
    expect(@user).to be_valid
  end
  it "is invalid without a name" do
    @user = User.create(email: 'drew@spoon.com')
    expect(@user).to_not be_valid
  end

  it "is invalid without an email" do
    @user = User.create(name: "Drew Reynolds")
    expect(@user).to_not be_valid
  end

  it "is invalid without a unique email" do
    @user_one = User.create(name:"Drew Reynolds", email: "drew@spoon.com")
    @user_two = User.create(name:"David Ryan", email: "drew@spoon.com")

    expect(@user_one).to be_valid
    expect(@user_two).to_not be_valid
  end
end
