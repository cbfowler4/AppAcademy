class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_cat_owner?

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def already_logged_in?
    redirect_to cats_url if current_user
  end

  def is_cat_owner?(id)
    current_user.cats.where(id: id).exists?
  end

  

end
