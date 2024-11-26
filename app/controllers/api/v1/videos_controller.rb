class Api::V1::VideosController < ApplicationController

  def show
    video = VideoGateway.fetch_video(params[:name])
    if video
      render json: video_data(video)
    else
      render json: { error: "Video not found" }, status: :not_found
    end
  end

  private

  def video_data(video)
    {
      video_id: video.video_id,
      title: video.title,
      description: video.description,
      thumbnail_url: video.thumbnail_url
    }
  end
end
