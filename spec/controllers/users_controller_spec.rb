require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "POST #login" do
    it "login successfully" do
      user = create(:user)
      post :login, :params => {:email => "test@gmail.com", :password => "123456"}
      expect(response).to be_redirect
      expect(session[:user_id]).to be(user.id)
    end

    it "register successfully" do
      post :login, :params => {:email => "test1@gmail.com", :password => "123456"}
      expect(response).to be_redirect
      user = User.find_by_email("test1@gmail.com")
      expect(session[:user_id]).to be(user.id)
    end

    it "email address is not valid" do
      post :login, :params => {:email => "test", :password => "123456"}
      expect(response).to be_redirect
      expect(flash[:alert]).to eq({:email => ["Email is not valid!"]})
    end

    it "password is not valid" do
      post :login, :params => {:email => "test2@gmail.com", :password => "1236"}
      expect(response).to be_redirect
      expect(flash[:alert]).to eq({:password => ["Password is too short (minimum is 6 characters)!"]})
    end

    it "password is not correct" do
      user = create(:user)
      post :login, :params => {:email => "test@gmail.com", :password => "1236"}
      expect(response).to be_redirect
      expect(flash[:alert]).to eq({:password => ["Password is not correct!"]})
    end
  end
end