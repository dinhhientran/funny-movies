require 'rails_helper'

RSpec.describe User, :type => :model do
  fixtures :all

  it "should save if required fields are valid" do
    user = create(:user)
    expect(Movie.new(
        :user_id => user.id,
        :title => "Video title 1",
        :embed_code => '<iframe src="//www.youtube.com/embed/3mMzr0Rc94c" frameborder="0" allowfullscreen="allowfullscreen"></iframe>',
        :url => "https://www.youtube.com/watch?v=3mMzr0Rc94c"
    )).to be_valid
  end

  it "should not save if user_id is not set" do
    expect(Movie.new(
        :user_id => nil,
        :title => "Video title 1",
        :embed_code => '<iframe src="//www.youtube.com/embed/3mMzr0Rc94c" frameborder="0" allowfullscreen="allowfullscreen"></iframe>',
        :url => "https://www.youtube.com/watch?v=3mMzr0Rc94c"
    )).to_not be_valid
  end

  it "should not save if title is not presence" do
    user = create(:user)
    expect(Movie.new(
        :user_id => user.id,
        :title => nil,
        :embed_code => '<iframe src="//www.youtube.com/embed/3mMzr0Rc94c" frameborder="0" allowfullscreen="allowfullscreen"></iframe>',
        :url => "https://www.youtube.com/watch?v=3mMzr0Rc94c"
    )).to_not be_valid
  end

  it "should not save if embed_code is not presence" do
    user = create(:user)
    expect(Movie.new(
        :user_id => user.id,
        :title => "Video title 1",
        :embed_code => nil,
        :url => "https://www.youtube.com/watch?v=3mMzr0Rc94c"
    )).to_not be_valid
  end

  it "should not save if url is not presence" do
    user = create(:user)
    expect(Movie.new(
        :user_id => user.id,
        :title => "Video title 1",
        :embed_code => '<iframe src="//www.youtube.com/embed/3mMzr0Rc94c" frameborder="0" allowfullscreen="allowfullscreen"></iframe>',
        :url => nil
    )).to_not be_valid
  end

  it "should not save if url is not valid" do
    user = create(:user)
    expect(Movie.new(
        :user_id => user.id,
        :title => "Video title 1",
        :embed_code => '<iframe src="//www.youtube.com/embed/3mMzr0Rc94c" frameborder="0" allowfullscreen="allowfullscreen"></iframe>',
        :url => 'invalid url'
    )).to_not be_valid
  end

  it "should not save if movie already exists" do
    user = create(:user)
    create(:movie, user: user, url: "https://www.youtube.com/watch?v=3mMzr0Rc94c")
    expect(Movie.new(
        :user_id => user.id,
        :title => "Video title 1",
        :embed_code => '<iframe src="//www.youtube.com/embed/3mMzr0Rc94c" frameborder="0" allowfullscreen="allowfullscreen"></iframe>',
        :url => "https://www.youtube.com/watch?v=3mMzr0Rc94c"
    )).to_not be_valid
  end
end
