class Seed
 def self.start
   new.generate
 end

 def generate
  #  create_items_with_categories
  #  create_users
  #  create_orders
 # end

 # def create_users
   user_list = [
               ["Rachel", "Warbelow", "demo+rachel@jumpstartlab.com", "password"],
               ["Jeff", "Casimir", "demo+jeff@jumpstartlab.com", "password", "j3"],
               ["Jorge", "Tellez", "demo+jorge@jumpstartlab.com", "password", "novohispano"],
               ["Josh", "Cheek", "demo+josh@jumpstartlab.com", "password", "josh", 1]
               ]
   user_list.each do |user|
     User.create(:first_name => user[0], :last_name => user[1], :email => user[2], :password => user[3], :username => user[4], :role => user[5])
   end
 # end

  # def create_orders
  # end


 # def create_items_with_categories
   fire  = Category.create(name: "Fire")
   water = Category.create(name: "Water")
   grass = Category.create(name: "Grass")
   electric = Category.create(name: "Electric")
   psychic = Category.create(name: "Psychic")
   bug = Category.create(name: "Bug")
   normal = Category.create(name: "Normal")
   ground = Category.create(name: "Ground")
   fairy = Category.create(name: "Fairy")

   Item.create(id: 1,title: "Pikachu", description: "desc", price: 900, image: "http://core.dawnolmo.com/50_pokemon__9_pikachu_by_megbeth-d5fga3f_original.png").categories << electric
   Item.create(id: 2, title: "Charmander", description: "desc", price: 1000, image: "http://img4.wikia.nocookie.net/__cb20140603214902/pokemon/images/9/96/004Charmander_OS_anime.png").categories << fire
   Item.create(id: 3, title: "Bulbasaur", description: "desc", price: 850, image: "http://vignette4.wikia.nocookie.net/gpxplus/images/b/b4/001_Bulbasaur_Pic.png/revision/20101225095459").categories << grass
   Item.create(id: 4, title: "Squirtle", description: "desc", price: 1200, image: "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png").categories << water
   Item.create(id: 5, title: "Ivysaur", description: "desc", price: 1150, image: "http://th01.deviantart.net/fs70/PRE/f/2014/002/d/e/pokemon_y__ivysaur_by_smiley_fakemon-d70i6v4.png").categories << grass
   Item.create(id: 6, title: "Blastoise", description: "desc", price: 950, image: "http://fc03.deviantart.net/fs70/f/2010/243/4/c/blastoise_by_xous54-d2xqh0g.png").categories << water
   Item.create(id: 7, title: "Metapod", description: "desc", price: 1100, image: "http://upload.wikimedia.org/wikipedia/id/archive/6/6b/20130416085037!Metapod.png").categories << bug
   Item.create(id: 8, title: "Caterpie", description: "desc", price: 800, image: "http://img3.wikia.nocookie.net/__cb20140911042209/pokemon/images/8/89/010Caterpie_Dream.png").categories << bug
   Item.create(id: 9, title: "Pidgeot", description: "desc", price: 850, image: "http://fc03.deviantart.net/fs70/i/2012/072/6/b/_018_tauboss___pidgeot_by_mrsjasminhardy-d4smgtl.png").categories << normal
   Item.create(id: 10, title: "Fearow", description: "desc", price: 1250, image: "http://vignette1.wikia.nocookie.net/es.pokemon/images/7/7b/Fearow_(anime_AG).png/revision/latest?cb=20120906023254").categories << normal
   Item.create(id: 11, title: "Sandshrew", description: "desc", price: 1000, image: "http://cdn.bulbagarden.net/upload/9/9e/027Sandshrew.png").categories << ground
   Item.create(id: 12, title: "Clefairy", description:"desc", price: 1050, image: "http://img1.wikia.nocookie.net/__cb20140910051252/pokemon/images/e/e8/035Clefairy_Dream.png").categories << fairy
   Item.create(id: 13, title: "Oddish", description: "desc", price: 800, image: "http://fc00.deviantart.net/fs70/i/2011/123/9/1/oddish_by_beyx-d3fjesv.png").categories << grass
   Item.create(id: 14, title: "Diglett", description: "desc", price: 900, image: "http://fc06.deviantart.net/fs70/f/2010/165/9/4/050___Diglett_by_cammarin.png").categories << ground
   Item.create(id: 15, title: "Meowth", description: "desc", price: 1200, image: "http://images.wikia.com/es.pokemon/images/1/13/Meowth_en_Pok%C3%A9mon_Mundo_Misterioso_2.png").categories << normal
   Item.create(id: 16, title: "Dedenne", description: "desc", price: 1300, image: "http://assets22.pokemon.com/assets/cms2/img/pokedex/full/702.png").categories << electric
   Item.create(id: 17, title: "Jolteon", description: "desc", price: 1150, image: "http://cdn.bulbagarden.net/upload/thumb/b/bb/135Jolteon.png/600px-135Jolteon.png").categories << electric
   Item.create(id: 18, title: "Electrode", description: "desc", price: 900, image: "http://cdn.bulbagarden.net/upload/thumb/8/84/101Electrode.png/600px-101Electrode.png").categories << electric
   Item.create(id: 19, title: "Mew", description: "desc", price: 950, image: "http://cdn.bulbagarden.net/upload/thumb/b/b1/151Mew.png/600px-151Mew.png").categories << psychic
   Item.create(id: 20, title: "Abra", description: "desc", price: 1000, image: "http://cdn.bulbagarden.net/upload/thumb/6/62/063Abra.png/600px-063Abra.png").categories << psychic
 # end

   o1 = Order.create(status: "ordered", user_id: 1).purchases.create(item_id: 1, quantity:2)
   o2 = Order.create(status: "completed", user_id: 1).purchases.create(item_id: 2, quantity:1)
   o3 = Order.create(status: "cancelled", user_id: 1).purchases.create(item_id: 3, quantity:2)
   o4 = Order.create(status: "ordered", user_id: 2).purchases.create(item_id: 4, quantity:2)
   o5 = Order.create(status: "completed", user_id: 2).purchases.create(item_id: 5, quantity:2)
   o6 = Order.create(status: "cancelled", user_id: 2).purchases.create(item_id: 6, quantity:2)
   o7 = Order.create(status: "ordered", user_id: 3).purchases.create(item_id: 7, quantity:1)
   o8 = Order.create(status: "completed", user_id: 3).purchases.create(item_id: 8, quantity:2)
   o9 = Order.create(status: "cancelled", user_id: 3).purchases.create(item_id: 9, quantity:2)
   o0 = Order.create(status: "completed", user_id: 3).purchases.create(item_id: 10, quantity:2)
 end
end

Seed.start
