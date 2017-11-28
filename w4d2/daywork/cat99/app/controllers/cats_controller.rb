class CatsController < ApplicationController
  
  def index
    @cats = Cat.all 
    render :index
  end 
  
  def show
    @cat = Cat.find(params[:id])
    render :show
  end 
  
  def new
    @cat = Cat.new
    render :new
  end 
  
  def create
    c = Cat.new(cat_params)
    if c.save 
      redirect_to cat_url(c)
    else 
      render json: c.errors.full_messages, status: 422
    end 
  end
  
  def edit 
    @cat = Cat.find(params[:id])
    render :edit
  end
  
  def update 
    c = Cat.find(params[:id])
    if c.update(cat_params) 
      redirect_to cat_url(c)
    else 
      render json: c.errors.full_messages, status: 422 
    end 
  end
  
  private 
  
  def cat_params 
    params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
  end  
  
end