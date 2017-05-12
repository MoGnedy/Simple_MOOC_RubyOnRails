require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is  not valid without attributes" do
    expect(User.new).to_not be_valid
  end

  it "is not valid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it "is valid with name, email, password" do
    user = User.new(name: 'Mohamed Gnedy', email: 'example@email.com',password:'123456')
    expect(user).to be_valid
  end


end
