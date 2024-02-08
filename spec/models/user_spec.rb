require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a email and password" do
    user = User.new(
      email: "user1@user.com",
      password: "user1pass",
    )
    expect(user).to be_valid
  end
end
