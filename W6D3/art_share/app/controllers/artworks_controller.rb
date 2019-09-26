class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    owned_artworks = user.artworks
    shared_artworks = user.shared_artworks
    
    render json: {:shared_artworks => shared_artworks, :owned_artworks => owned_artworks}
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

  def fave
    artwork = Artwork.find(params[:id])
    if artwork.favorite == false
      artwork.update_column(:favorite, true)
      # artwork.favorite = true
      # artwork.save
    else
      artwork.update_column(:favorite, false)
      # artwork.favorite = false
      # artwork.save
    end
      render json: artwork
  end
  private
  def artwork_params 
    params.require(:artwork).permit(:title, :image_url, :artist_id, :favorite)
  end
end
