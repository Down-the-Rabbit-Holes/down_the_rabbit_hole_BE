class AnimalGateway

  def self.animal_connection
    Faraday.new(url: "https://api.api-ninjas.com") do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.ninja_animals[:key]
    end
  end

  def self.photo_connection
    Faraday.new(url: "https://api.pexels.com") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.pexels[:key]
    end
  end

  def self.fetch_animal_data(animal_name)
    response = animal_connection.get("/v1/animals?name=#{animal_name}")
    animals = parse_response(response)
    valid_animal?(animals)
    
  end

  def self.fetch_photo_data(animal_name)
    response = photo_connection.get("/v1/search?query=#{animal_name}")
    parse_response(response)
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.valid_animal?(animals)
    animals.find do |animal|
      animal.dig(:characteristics, :predators) &&
      (animal[:locations].include?("North-America") ||
      animal[:locations].include?("Central-America"))
    end
  end
end