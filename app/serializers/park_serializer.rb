class ParkSerializer
    include JSONAPI::Serializer
    attributes :name, :location, :description, :annual_visitors
  
    has_many :animals
  end