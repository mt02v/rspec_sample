require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a email and password" do
    user = User.new(
      email: "user1@user.com",
      password: "user1pass",
    )
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(
      email: nil,
      password: "user1pass"
    )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      email: "user1@user.com",
      password: "user1pass",
    )
    user = User.new(
      email: "user1@user.com",
      password: "user2pass",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

    it "factorybot test" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

    it "factorybot 2" do
      user = FactoryBot.create(:user, :a)
      expect(user.email).to eq "email@1.com"
    end
end
