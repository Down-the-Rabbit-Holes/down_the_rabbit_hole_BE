class AnimalSerializer
  include JSONAPI::Serializer
  attributes :name,
             :photo_url,
             :prey, 
             :predators, 
             :habitat, 
             :scientific_name,
             :diet,
             :top_speed,
             :life_span,
             :weight,
             :fun_fact
end
