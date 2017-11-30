class UsersController < ApplicationController
  before_action :ensure_login, only: [:destroy]
  
  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user.id)
    else 
      flash.now[:errors] = user.errors.full_messages
      redirect_to new_user
    end
  end
  
  def new
  end 
  
  def edit
    
  end
  
  def update
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def destroy
    user = User.find_by_credentials(email, password)
    user.destroy
    render plain: "user has been deleted"
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
  
end