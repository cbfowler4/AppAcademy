class AlbumsController < ApplicationController
  
  before_action :ensure_login
  
  def create
    album = Album.new(album_params)
    if album.save!
      redirect_to album_url(album.id)
    else 
      flash.now[:errors] = album.errors.full_messages
      redirect_to new_album_url
    end
  end
  
  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end
  
  def show
    @album = Album.find(params[:id])
    render :show
  end 
  
  def edit 
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end 
  
  def update 
    album = Album.find(params[:id])
    if album.update!
      redirect_to album_url(album.id)
    else
      flash.now[:errors] = album.errors.full_messages
      redirect_to edit_album_url(params[:id])
    end
  end 
  
  def destroy 
    album = Album.find(params[:id])
    if album 
      album.destroy
      redirect_to bands_url
    else
      flash.now[:errors] = "Band not found"
      redirect_to bands_url
    end
  end 
  
  private
    
    def album_params
      params.require(:album).permit(:title, :year, :studio, :band)
    end
end