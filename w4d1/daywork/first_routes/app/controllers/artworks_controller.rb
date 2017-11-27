class ArtworksController < ApplicationController
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  def index 
    user = User.find(params[:user_id])
    artworks = user.artworks + user.shared_artworks
    
    render json: artworks
  end 
  
  def show
    artwork = Artwork.find(params[:id])
    if artwork 
      render json: artwork 
    else 
      render plain: 'Artwork not found'
    end
  end 
  
  def destroy 
    artwork = Artwork.find(params[:id])
    artwork.destroy 
    render plain: 'Artwork has been deleted'
  end 
  
  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork 
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  private
  
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end 
end