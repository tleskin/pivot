class Seed
 
  def self.start
    new.generate
  end

  def generate
    create_regions
  end

  def create_regions
    21.times do
      name = Faker::Company.name
      Region.create!(name: name, description: Faker::Lorem.sentence, image: File.open('app/assets/images/default_image.jpg'))    
      puts "Region #{name} created"
    end
  end

end

Seed.start
