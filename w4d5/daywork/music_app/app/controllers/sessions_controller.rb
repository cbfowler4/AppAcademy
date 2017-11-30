class SessionsController < ApplicationController


  def new
  end 
  
  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    unless user.nil?
      login(user)
      redirect_to bands_url
    else
      flash.now[:errors] = "Invalid credentials"
      redirect_to new_session_url
    end
  end
  
  def destroy
    if current_user
      session[:session_token] = nil
      current_user.reset_session_token!
      redirect_to new_session_url
    else
      flash.now[:errors] = "you are not signed in"
      render :new
    end    
  end
  
  
  
  
end