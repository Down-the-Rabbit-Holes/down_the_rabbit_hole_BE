require 'csv'

# Define animal data
animals = [
  
  {
  name: "Moose",
  scientific_name: "Alces alces",
  photo_url: "https://images.pexels.com/photos/76972/moose-moose-rack-male-bull-76972.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
  description: "Moose are the largest members of the deer family, known for their large size, long legs, and broad antlers. They are commonly found in North America, Europe, and Asia.",
  top_speed: 35,
  life_span: 15,
  weight: 1200,
  height: 6.5,
  length: 10,
  habitat: "Forests, wetlands, lakesides",
  predators: "gray wolves, mountain lions, black bears, coyotes",   
  prey: "",
  fun_fact: "Moose are excellent swimmers and can dive underwater to feed on aquatic plants.",
  animal_type: "mammal",
  diet: "Herbivore"
},  
  {
    name: "Black Bear",
    scientific_name: "Ursus americanus",
    photo_url: "https://images.pexels.com/photos/23914453/pexels-photo-23914453.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    top_speed: "30 mph",
    life_span: "25 years",
    weight: "300 lbs",
    height: "3 ft at shoulders",
    length: "6 ft",
    habitat: "Forests, Mountain Areas",
    predators: "mountain lions",
    prey: "ants, termites, brook trout, rainbow trout, brown trout, pika, yellow-bellied marmots, cottontail rabbits, bighorn sheep, mule deer, yellow-bellied marmots",
    fun_fact: "Black bears can climb trees with ease.",
    description: "Shy, omnivorous bear that avoids humans but loves berries and nuts.",
    animal_type: "mammal",
    diet: "Omnivore"
  },
{
    name: "Elk",
    scientific_name: "Cervus canadensis", 
    photo_url: "https://images.pexels.com/photos/29483733/pexels-photo-29483733.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "Large members of the deer family, commonly seen grazing in the meadows of RMNP.",
    top_speed: 45,
    life_span: 10,
    weight: 700,
    height: 4.5,
    length: 8,
    habitat: "Forests, meadows",
    predators: "mountain lions, black bears, gray wolves",
    prey: "",
    fun_fact: "Male elk are known for their bugling calls during the mating season.",
    animal_type: "mammal",
    diet: "Herbivore"
  },
  {
    name: "Bighorn Sheep",
    scientific_name: "Ovis canadensis",
    photo_url: "https://images.pexels.com/photos/12792487/pexels-photo-12792487.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "Famous for their massive curved horns, often spotted on rugged mountain slopes.",
    top_speed: 30,
    life_span: 15,
    weight: 200,
    height: 3,
    length: 5,
    habitat: "Rocky cliffs, mountain meadows",
    predators: "mountain lions, coyotes, golden eagles, black bears",
    prey: "",
    fun_fact: "Their horns can weigh up to 30 pounds, about the weight of a small child.",
    animal_type: "mammal",
    diet: "Herbivore"
  },
  {
    name: "Mule Deer",
    scientific_name: "Odocoileus hemionus",
    photo_url: "https://images.pexels.com/photos/51390/elk-wildlife-nature-animal-51390.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "Named for their large, mule-like ears, often seen at dawn or dusk.",
    top_speed: 35,
    life_span: 9,
    weight: 200,
    height: 3.5,
    length: 6,
    habitat: "Open woodlands, shrublands",
    predators: "mountain lions, coyotes, black bears, bobcats, golden eagles",
    prey: "",
    fun_fact: "They bound with a unique hopping motion called stotting.",
    animal_type: "mammal",
    diet: "Herbivore"
  },
  {
    name: "Yellow-Bellied Marmot",
    scientific_name: "Marmota flaviventris",
    photo_url: "https://images.pexels.com/photos/12766489/pexels-photo-12766489.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "A large ground squirrel often called the 'whistle pig' for its loud alarm calls.",
    top_speed: 10,
    life_span: 15,
    weight: 12,
    height: 1,
    length: 2,
    habitat: "Alpine meadows, rocky outcrops",
    predators: "coyotes, red foxes, golden eagles, bobcats, black bears",
    prey: "",
    fun_fact: "They hibernate for up to 8 months of the year.",
    animal_type: "mammal",
    diet: "Herbivore"
  },
  {
    name: "Coyote",
    scientific_name: "Canis latrans",
    photo_url: "https://images.pexels.com/photos/15707992/pexels-photo-15707992.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "A versatile canine known for its intelligence and adaptability.",
    top_speed: 43,
    life_span: 10,
    weight: 30,
    height: 2,
    length: 4.5,
    habitat: "Grasslands, forests, mountains",
    predators: "mountain lions, wolves, black bears",
    prey: "bighorn sheep, mule deer, yellow-bellied marmots, mountain cottontail rabbits,  albert's squirrels, pine squirrels, chimpmunk, pikas, mule deer, grasshoppers",
    fun_fact: "Coyotes communicate using a variety of howls, yips, and barks.",
    animal_type: "mammal",
    diet: "Omnivore"
  },
  {
    name: "Beaver",
    scientific_name: "Castor canadensis",
    photo_url: "https://images.pexels.com/photos/12399354/pexels-photo-12399354.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "A master architect of the animal kingdom, known for building dams and lodges.",
    top_speed: 6,
    life_span: 12,
    weight: 60,
    height: 1.5,
    length: 3,
    habitat: "Streams, rivers, wetlands",
    predators: "mountain lions, gray wolves, black bears, coyotes",
    prey: "",
    fun_fact: "Their teeth never stop growing and are self-sharpening.",
    animal_type: "mammal",
    diet: "Herbivore"
  },
  {
    name: "Bat",
    scientific_name: "Chiroptera (Various species)",
    photo_url: "https://images.pexels.com/photos/2587639/pexels-photo-2587639.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "The only mammals capable of sustained flight, with diverse species in RMNP.",
    top_speed: 60,
    life_span: 20,
    weight: 0.5,
    height: 0.1,
    length: 0.2,
    habitat: "Caves, forests, rock crevices",
    predators: "great-horned owl, coyotes, red-tailed hawks, peregrine falcons, raccoons, bobcats",
    prey: "mosquitoes, snowberry clearwing moth",
    fun_fact: "Bats use echolocation to navigate and hunt in the dark.",
    animal_type: "mammal",
    diet: "Insectivore"
  },
  {
    name: "Mountain Lion",
    scientific_name: "Puma concolor",
    photo_url: "https://images.pexels.com/photos/29070042/pexels-photo-29070042.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    description: "A stealthy predator also known as a cougar or puma.",
    top_speed: 50,
    life_span: 12,
    weight: 140,
    height: 2.5,
    length: 8,
    habitat: "Mountain forests, deserts",
    predators: "",
    prey: "bighorn sheep, mule deer, beaver, elk, coyotes, raccoons, cottontail rabbit",
    fun_fact: "Mountain lions can leap as far as 40 feet in a single bound.",
    animal_type: "mammal",
    diet: "Carnivore"
  }
  # Add the rest of your animals here
]

# Specify CSV file path
csv_file_path = "animals.csv"

# Write to CSV file
CSV.open(csv_file_path, "w") do |csv|
  # Add headers
  csv << ["name", "scientific_name", "photo_url", "description", "top_speed", "life_span", "weight", "height", "length", "habitat", "predators", "prey", "fun_fact", "animal_type", "diet"]

  # Add animal data
  animals.each do |animal|
    csv << [
      animal[:name],
      animal[:scientific_name],
      animal[:photo_url],
      animal[:description],
      animal[:top_speed],
      animal[:life_span],
      animal[:weight],
      animal[:height],
      animal[:length],
      animal[:habitat],
      animal[:predators],
      animal[:prey],
      animal[:fun_fact],
      animal[:animal_type],
      animal[:diet]
    ]
  end
end

puts "CSV file created at #{csv_file_path}"