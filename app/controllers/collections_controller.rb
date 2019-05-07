class CollectionsController < ApplicationController
  def index
    collections = Collection.where(user_id: params[:user_id])

    render json: collections
  end

  def create
    collection = Collection.new(collection_params)

    if collection.save
      render json: collection, status: :created
    else
      render json: collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: Collection.find(params[:id])
  end

  def destroy
    collection = Collection.find(params[:id])

    if collection.destroy
      render json: collection, status: :destroyed
    else
      render json: collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def add_artwork
    collection_artwork = CollectionArtwork.new(collection_id: params[:collection_id], artwork_id: params[:artwork_id])

    if collection_artwork.save
      render json: collection_artwork, status: :created
    else
      render json: collection_artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def remove_artwork
    collection_artwork = CollectionArtwork.find_by(collection_id: params[:collection_id], artwork_id: params[:artwork_id])

    if collection_artwork.destroy
      render json: collection_artwork, status: :destroyed
    else
      render json: collection_artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:user_id, :name)
  end
end
