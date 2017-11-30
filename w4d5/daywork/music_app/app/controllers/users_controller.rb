class UsersController < ApplicationController

  
  def create
    user = User.new(user_params)
    if user.save
      render plain: "user created"
    else 
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end
  
  def new
  end 
  
  def edit
  end
  
  def update
  end
  
  def destroy
    user = User.find_by_credentials()
    user.destroy
    render plain: "user has been deleted"
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end