require 'rails_helper'

RSpec.describe ShareController, type: :controller do
  render_views

  describe "GET #index" do
    it "is accessible if logged in" do
      user = create(:user)
      session[:user_id] = user.id
      get :index
      expect(response.status).to eq(200)
    end

    it "redirect to home page if not logged in yet" do
      get :index
      expect(response).to be_redirect
    end
  end

  describe "POST #share" do
    it "share youtube video successfully" do
      user = create(:user)
      session[:user_id] = user.id
      youtubeUrl = "https://www.youtube.com/watch?v=GWDOwTVWi6A"
      post :share, :params => {:youtube_url => youtubeUrl}
      expect(response).to be_redirect
      movie = Movie.find_by_url(youtubeUrl)
      expect(movie).to_not be(nil)
    end

    it "youtube url is not valid" do
      user = create(:user)
      session[:user_id] = user.id
      post :share, :params => {:youtube_url => "not valid youtube url"}
      expect(response).to be_redirect
      expect(flash[:alert]).to eq({:youtube_url => ["Youtube URL is not valid!"]})
    end

    it "youtube video is not available" do
      user = create(:user)
      session[:user_id] = user.id
      post :share, :params => {:youtube_url => "https://www.youtube.com/watch?v=5X1kLyVcmnc"} # This is an unavailable video
      expect(response).to be_redirect
      expect(flash[:alert]).to eq({:youtube_url => ["This Youtube video is not available!"]})
    end
  end
end