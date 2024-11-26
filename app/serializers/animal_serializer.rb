class AnimalSerializer
  include JSONAPI::Serializer
  attributes :name,
             :photo_url,
             :habitat, 
             :scientific_name,
             :diet,
             :top_speed,
             :life_span,
             :weight,
             :fun_fact

             has_many :prey, serializer: AnimalSerializer
             has_many :predators, serializer: AnimalSerializer
            #  has_many :parks, serializer: ParkSerializer
end
