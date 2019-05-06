class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(share_params)

    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])

    share.destroy
    render json: share
  end

  def favorite
    artwork_share = ArtworkShare.find_by(id: params[:id], viewer_id: params[:user_id])
    if artwork_share
      artwork_share.favorite = true
      artwork_share.save
    end
    render json: artwork_share
  end

  def unfavorite
    artwork_share = ArtworkShare.find_by(id: params[:id], viewer_id: params[:user_id])
    if artwork_share
      artwork_share.favorite = false
      artwork_share.save
    end
    render json: artwork_share
  end

  private

  def share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
