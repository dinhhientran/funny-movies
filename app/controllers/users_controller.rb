class UsersController < ApplicationController

  def login
    @user = User.find_by(email: params[:email])

    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
      else
        flash[:alert] = {:password => ["Password is not correct!"]}
      end
    else
      register(params[:email], params[:password])
      session[:user_id] = @user.id
    end

    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url
  end

  private
  def register(email, password)
    @user = User.new(email: email, password: password)
    if @user.valid?
      @user.save
    else
      flash[:alert] = @user.errors.messages
    end
  end
end
