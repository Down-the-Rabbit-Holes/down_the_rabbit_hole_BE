class AnimalSerializer
  include JSONAPI::Serializer
  attributes :name,
             :scientific_name,
             :photo_url,
             :description,
             :group_name,
             :baby_name,
             :top_speed,
             :life_span,
             :weight,
             :height,
             :length,
             :habitat, 
             :fun_fact,
             :animal_type,
             :diet

             has_many :prey, serializer: AnimalSerializer
             has_many :predators, serializer: AnimalSerializer
             has_many :parks, serializer: ParkSerializer
end
