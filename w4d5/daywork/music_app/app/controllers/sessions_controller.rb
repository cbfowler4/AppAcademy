class SessionsController < ApplicationController


  def new
  end 
  
  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    unless user.nil?
      login(user)
      render plain: "you are now logged in"
    else
      flash.now[:errors] = "Invalid credentials"
      render :new
    end
  end
  
  def destroy
    if current_user
      session[:session_token] = nil
      current_user.reset_session_token!
    else
      flash.now[:errors] = "you are not signed in"
      render :new
    end    
  end
  
  
  
  
end