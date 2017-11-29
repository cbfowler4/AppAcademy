class SessionsController < ApplicationController
  before_action :already_logged_in?, only: :new
  
  def new
  end

  def create
    user = User.find_by(user_name: params[:user][:user_name])
    if user && user.is_password?(params[:user][:password])
      login(user)
      redirect_to cats_url
    else
      flash.now[:errors] = "Invalid credentials"
      redirect_to new_session_url
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to cats_url
  end

end
