class Api::V1::VideosController < ApplicationController

  def show
    video_data = VideoGateway.fetch_video(params[:name])
    if video_data
      video = Video.new(video_data)
      render json: video.to_json
    else
      render json: { error: "Video not found" }, status: :not_found
    end
  end
end
