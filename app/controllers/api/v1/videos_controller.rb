class Api::V1::VideosController < ApplicationController

  def show
    video = VideoGateway.fetch_video(params[:name])
    if video
      render json: video
    else
      render json: { error: "Video not found" }, status: :not_found
    end
  end
  
  private

end
