require 'rails_helper'

RSpec.describe Course, :type => :model do
  subject { described_class.new }
  it "is not valid without attributes" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

it "is valid with a title" do
    subject.title = 'Java Course'
    expect(subject).to be_valid
  end


end
