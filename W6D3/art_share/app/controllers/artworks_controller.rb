class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    owned_artworks = user.artworks
    shared_artworks = user.shared_artworks
  
    render json: shared_artworks
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
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
