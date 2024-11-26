require 'csv'

parks = [
    {
        "name": "Great Smoky Mountains National Park",
        "location": "Tennessee/North Carolina",
        "description": "Known for its mist-covered mountains, diverse plant and animal life, and rich history, this park is America’s most visited, offering a blend of scenic beauty and cultural heritage.",
        "annual_visitors": "13.3 million visitors"
    },
    {
        "name": "Grand Canyon National Park",
        "location": "Arizona",
        "description": "Famous for its massive, awe-inspiring canyon carved by the Colorado River, this iconic park attracts visitors for hiking, rafting, and stunning vistas.",
        "annual_visitors": "4.7 million visitors"
    },
    {
        "name": "Zion National Park",
        "location": "Utah",
        "description": "With towering sandstone cliffs, canyons, and trails like Angel’s Landing, Zion is a haven for adventurous hikers and nature lovers.",
        "annual_visitors": "4.6 million visitors"
    },
    {
        "name": "Yellowstone National Park",
        "location": "Wyoming/Montana/Idaho",
        "description": "The first national park in the world, Yellowstone features geothermal wonders like Old Faithful, as well as abundant wildlife including bison and grizzly bears.",
        "annual_visitors": "4.5 million visitors"
    },
    {
        "name": "Rocky Mountain National Park",
        "location": "Colorado",
        "description": "Known for its high-altitude trails, alpine lakes, and towering peaks, Rocky Mountain National Park offers breathtaking views and diverse ecosystems.",
        "annual_visitors": "4.1 million visitors"
    },
    {
        "name": "Yosemite National Park",
        "location": "California",
        "description": "Famous for its granite cliffs, waterfalls, and giant sequoias, Yosemite is a paradise for outdoor enthusiasts and photographers alike.",
        "annual_visitors": "3.9 million visitors"
    }
]

csv_file_path = "test_parks.csv"

CSV.open(csv_file_path, "w") do |csv|
    csv << ["name", "location", "description", "annual_visitors"]

    parks.each do |park|
        csv << [
          park[:name],
          park[:location],
          park[:description],
          park[:annual_visitors]
        ]
      end
    end
    
    puts "CSV file created at #{csv_file_path}"




