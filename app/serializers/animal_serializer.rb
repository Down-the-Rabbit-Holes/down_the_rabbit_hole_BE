class AnimalSerializer
  include JSONAPI::Serializer
  attributes :name, :photo_url, :prey, :predators, :habitat, :scientific_name
end
