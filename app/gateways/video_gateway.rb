class VideoGateway

  YOUTUBE_API_URL = "https://youtube.googleapis.com/youtube/v3/search"

  def self.fetch_video(animal_name)
    response = youtube_connection.get do |req|
      req.params[:key] = Rails.application.credentials.youtube_data_api[:key]
      req.params[:part] = 'snippet'
      req.params[:q] = "how+to+draw+#{animal_name}"
      req.params[:safeSearch] = 'strict'
    end
    parse_response(response)
  end
  
  private

  def self.youtube_connection
    Faraday.new(url: YOUTUBE_API_URL)
  end

  def self.parse_response(response)
    data = JSON.parse(response.body, symbolize_names: true)
    items = data[:items]

    items.any? ? Video.new(items.first) : nil
  end
end