require 'rails_helper'

RSpec.describe User, :type => :model do
  fixtures :all

  it "should save if both email and password is valid" do
    expect(User.new(:email => "test1@gmail.com", :password => "123456")).to be_valid
  end

  it "should not save if email is not presence" do
    expect(User.new(:email => nil, :password => '123456')).to_not be_valid
  end

  it "should not save if email is not valid" do
    expect(User.new(:email => "not valid email", :password => "123456")).to_not be_valid
  end

  it "should not save if email is not unique" do
    create(:user)
    expect(User.new(:email => "test@gmail.com", :password => "123456")).to_not be_valid
  end

  it "should not save if password is not presence" do
    expect(User.new(:email => "test1@gmail.com", :password => nil)).to_not be_valid
  end

  it "should not save if password is not valid" do
    expect(User.new(:email => "test1@gmail.com", :password => "123")).to_not be_valid
  end

end
