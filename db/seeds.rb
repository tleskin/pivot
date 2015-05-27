class Seed

  def self.start
    new.generate
  end

  def generate
    create_regions
    create_users
    create_categories
    create_businesses
    create_investments
    calculate_funding_to_date
  end

  def create_regions
    20.times do
      name = Faker::Company.name
      Region.create!(name: name, description: Faker::Lorem.sentence, image: File.open('app/assets/images/default_region_image.jpg'))
    end
    puts "20 Regions created."
  end

  def create_users
    create_jorge_platform_admin
    create_sam_business_admin
    create_regional_managers
    create_default_users
    create_josh_default_user
  end

  def create_regional_managers
    region = 1;
    i = 1
    57.times do
      email = Faker::Internet.email
      User.create!(first_name: Faker::Name.first_name,
                   last_name:  Faker::Name.last_name,
                   email:      email,
                   password:   "password",
                   role:       1,
                   region_id:  region
                  )
      region += 1 if i%3 == 0
      i += 1
    end
    puts "58 regional managers created (including Sam)."
  end

  def create_default_users
    100.times do
      email = Faker::Internet.email
      User.create!(first_name: Faker::Name.first_name,
                   last_name:  Faker::Name.last_name,
                   email:      email,
                   password:   "password"
                  )
    end
    puts "100 default users created (including Josh)."
  end

  def create_josh_default_user
    User.create!(first_name: "Josh",
                 last_name:  "Mejia",
                 email:      "josh@turing.io",
                 password:   "password"
                )
  end

  def create_jorge_platform_admin
    User.create!(first_name: "Jorge",
                 last_name:  "Tellez",
                 email:      "jorge@turing.io",
                 password:   "password",
                 role:       2
                )
    puts "God user Jorge created."
  end


  def create_sam_business_admin
    User.create!(first_name: "Sam",
                 last_name:  "Houston",
                 email:      "sam@turing.io",
                 password:   "password",
                 role:       1,
                 region_id:  1
                )
  end

  def create_categories
    categories = ['Agriculture', 'Hospitality', 'Manufacturing', 'Health', 'Food', 'Education', 'Services', 'Women', 'Shelter', 'Conflict Zones']
    categories.each do |category|
      Category.create!(name: category)
    end
    puts "10 categories created."
  end

  def create_businesses
    category = 1
    10.times do
      50.times do
        Category.find(category).businesses << create_a_business
      end
      category += 1
    end
    puts "500 businesses created."
  end

  def create_a_business
    funding = Random.rand(10000..200000)
    Business.create(name: Faker::Company.name,
                    description: Faker::Lorem.sentence,
                    region_id: Region.all.sample.id,
                    funding_needed: funding,
                    image: File.open('app/assets/images/default_business_image.jpg') )
  end

  def create_investments
    user_id = (User.last.id - 100)
    101.times do
      create_user_investments(user_id)
      user_id += 1
    end
    puts "1,000 investments created."
  end

  def create_user_investments(user_id)
    10.times do
      investment = Random.rand(100..10000)
      business_id = Business.all.sample.id
      Investment.create!(user_id: user_id, business_id: business_id, amount: investment)
    end
  end

  def calculate_funding_to_date
    Business.all.each { |business| business.add_to_funding }
  end

end

Seed.start
