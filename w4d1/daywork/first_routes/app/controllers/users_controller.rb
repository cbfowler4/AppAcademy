class UsersController < ApplicationController
  def index
    if params[:username]
      keyword = "%#{params[:username]}%"
      users = User.all.where('users.username LIKE ?', keyword)
    else 
      users = User.all
    end
    render json: users
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user = User.find(params[:id])
    if user 
      render json: user 
    else 
      render plain: 'User not found'
    end
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user 
    else 
      render json: user.errors.full_messages, status: 422
    end
  end 
  
  def destroy 
    user = User.find(params[:id])
    user.destroy
    render plain: 'User has been deleted'
  end 
  
  private
  
  def user_params
    params[:user].permit(:username)
  end
end
