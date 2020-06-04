# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'open-uri'

photos = ['https://miro.medium.com/max/11762/1*3LYHYoXdEpguaL3leuA1tA.jpeg', 
          'https://content.fortune.com/wp-content/uploads/2019/02/gettyimages-1084681900-e1551108238401.jpg', 
          'https://www.nationalgeographic.com/content/dam/environment/photos/future_of_food/organic_farming_rough/01_organic_farming_i8860_20181003_11260.adapt.1900.1.jpg', 
          'https://www.sonomacounty.com/sites/default/files/2019-03/farms_farmers_markets_petaluma_sonoma_county_069_2000_1125.jpg',
          'https://www.yesmagazine.org/wp-content/uploads/imports/1fe74cb08af74b39b5cada38382e9233.jpg',
          'https://cam-techsecurity.co.uk/wp-content/uploads/2019/11/farm-security-scaled.jpg',
          'https://d3d3n1vruxyser.cloudfront.net/media/filer_public_thumbnails/filer_public/a5/6d/a56d9510-07ac-4a09-be3e-3712dc9c818d/cmv-farms-banner-2.png__2340x782_q85_crop_subsampling-2_upscale.png',
          'https://images.squarespace-cdn.com/content/v1/510c8a59e4b060f86e6e5517/1486506717730-XEQ06KU8CS8IMXFUVE9M/ke17ZwdGBToddI8pDm48kKDKtHioz13A6gTD6cP2SJZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0ooWhOa5cxQSJsU3rXf8luX33ZLveKUc0IfIDXzCtWBDa4GLkaq2lSHIaS7p2YxCXg/IMG_0279.JPG?format=2500w',
          'https://www.openaccessgovernment.org/wp-content/uploads/2019/05/dreamstime_xxl_57105422.jpg',
          'https://calorganicfarms.com/wp-content/uploads/2017/10/video-poster.jpg',
          'https://1efnyhsj63r2fo5g01erbmcv-wpengine.netdna-ssl.com/wp-content/uploads/2018/11/rye_field_at_sunset-by-malin_k-368004-unsplash-1400x600.jpg',
          'https://images.squarespace-cdn.com/content/v1/5320c154e4b011a3c71a0cb8/1440224642504-8I6NP0WXGZYMG7UHM1QS/ke17ZwdGBToddI8pDm48kDHPSfPanjkWqhH6pl6g5ph7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0mwONMR1ELp49Lyc52iWr5dNb1QJw9casjKdtTg1_-y4jz4ptJBmI9gQmbjSQnNGng/IMG_4441_edited.jpeg?format=1500w',
          'https://imgmedia.lbb.in/media/2019/06/5d009b0fbdd9f348818bfe5a_1560320783272.jpg',
          'https://images.squarespace-cdn.com/content/v1/5ea742bbf02561696504b781/1589854635920-URBHO1PREZ2T8EBWDW0M/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/Donal+Yasukochi+-+Farm+Pic+5.JPG?format=2500w',
          'https://huilecbd.be/wp-content/uploads/2019/05/4136/village-farms-international-est-il-un-achat.jpg',
          'https://cdn.shopify.com/s/files/1/1438/7790/files/Picture1_cce406f0-597e-4a2e-96c6-4bbd11dd9342_2048x.jpg?v=1568852225',
          'https://cf-images.us-east-1.prod.boltdns.net/v1/static/5615998031001/e5ea96c4-0cda-4141-9bdd-aa4914100a79/e48ae8a8-f14f-41e5-a7a1-67dbad78d982/1280x720/match/image.jpg',
          'https://www.gohawaii.com/sites/default/files/styles/image_gallery_bg_xl/public/hero-unit-images/11984-Farm%20Tours%20in%20Hawaii.jpg?itok=tz9KIuFo',
          'https://1gkys61108am2vvslv1ayriu-wpengine.netdna-ssl.com/wp-content/uploads/2019/08/20160603_202013.jpg',
          'https://static01.nyt.com/images/2019/10/29/world/xxfarms10/xxfarms10-mobileMasterAt3x.jpg',
          'https://www.mercurynews.com/wp-content/uploads/2020/05/SJM-L-FARMS-0531-01.jpg',
          'https://media.bizj.us/view/img/11396669/80-acres-farms-interior*1200xx1622-914-0-160.png',
          'https://d279m997dpfwgl.cloudfront.net/wp/2020/04/DSC_1069-2.jpg',
          'https://www.ardryfarms.com/uploads/1/7/6/5/17658569/spring40_1_orig.jpg',
          'https://www.hughlowefarms.com/imager/uploads/48/Hugh-Lowe-Farms-Hero_b29007faa48e3f4a491bae738aa9e177.jpg',
          'https://www.pinata.com.au/media/cache/1220x670p/0/1/351/391946/media-download-1-strawberry.jpg'
        ]

puts "\nCleaning database..."

Farm.destroy_all
User.destroy_all
Category.destroy_all
Criterion.destroy_all
Scoring.destroy_all
Clap.destroy_all

puts 'Database is clean as a whistle'


puts "\nCreating categories ..."

social = Category.new(
  name: "Social",
  method: "",
  score: "",
  perspective: "",
  interest: "" )
social.save!
puts "The \"#{social.name}\" category has been created"

economic = Category.new(
  name: "Économique",
  method: "",
  score: "",
  perspective: "",
  interest: "" )
economic.save!
puts "The \"#{economic.name}\" category has been created"

environmental = Category.new(
  name: "Environnemental",
  method: "",
  score: "",
  perspective: "",
  interest: "" )
environmental.save!
puts "The \"#{environmental.name}\" category has been created"

global = Category.new(
  name: "Global",
  method: "",
  score: "",
  perspective: "",
  interest: "" )
global.save!
puts "The \"#{global.name}\" category has been created"

puts 'Categories have been created'


puts "\nParsing the csv..."

CSV.foreach('db/eco_criterions.csv') do |row|
  eco_criterion = Criterion.new(
    name: row[0],
    details: row[1] )
  eco_criterion.category = economic
  eco_criterion.save!
end

CSV.foreach('db/env_criterions.csv') do |row|
  env_criterion = Criterion.new(
    name: row[0],
    details: row[1] )
  env_criterion.category = environmental
  env_criterion.save!
end

CSV.foreach('db/soc_criterions.csv') do |row|
  soc_criterion = Criterion.new(
    name: row[0],
    details: row[1] )
  soc_criterion.category = social
  soc_criterion.save!
end

CSV.foreach('db/glo_criterions.csv') do |row|
  glo_criterion = Criterion.new(
    name: row[0],
    details: row[1] )
  glo_criterion.category = global
  glo_criterion.save!
end

puts 'Criteria have been created'


puts "\nParsing the csv..."

def true?(obj)
  obj.to_s.downcase == "true"
end

def random_password(length=10)
  chars  = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
  chars.sort_by { rand }.join[0...length]
end

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# filepath    = 'seeds.csv'
CSV.foreach('db/reseeds.csv') do |row|
  
  user = User.new(
    email: row[11], 
    password: random_password(length=10) )
  user.first_name = ['Martin', 'Sylvie', 'Boris', 'Fred', 'Nina'].sample
  user.last_name = ['Mauriac', 'Dupont', 'Le Floc', 'Basin', 'Vazyvaza'].sample
  user.phone_number = '06 22 55 40 68'
  user.save!

  
  farm = Farm.new(
    name: row[0],
    address: row[1],
    sector: row[3],
    private: true?(row[4]),
    description: row[5],
    url: row[10],
    cultures: row[13],
    surface: row[14].to_i,
    employees: row[15].to_i )
    farm.user = user
    puts 'Adding photos to farms'
    photos.sample(rand(1..3)).each do |photo|
      farm.photos.attach(io: URI.open(photo), filename: 'photo.jpg')
    end
  farm.save!

  # ------------------- GLOBAL SCORING -------------------

  aut_scoring = Scoring.new(
    score: row[30].to_i,
    details: row[31] )
  aut_scoring.farm = farm
  aut_scoring.criterion = Criterion.find_by(name: 'Autonomie')
  aut_scoring.save!
  
  cp_scoring = Scoring.new(
    score: row[32].to_i,
    details: row[33] )
  cp_scoring.farm = farm
  cp_scoring.criterion = Criterion.find_by(name: 'Capacite productive')
  cp_scoring.save!

  rob_scoring = Scoring.new(
    score: row[34].to_i,
    details: row[35] )
  rob_scoring.farm = farm
  rob_scoring.criterion = Criterion.find_by(name: 'Robustesse')
  rob_scoring.save!

  anc_scoring = Scoring.new(
    score: row[36].to_i,
    details: row[37] )
  anc_scoring.farm = farm
  anc_scoring.criterion = Criterion.find_by(name: 'Ancrage territorial')
  anc_scoring.save!

  rs_scoring = Scoring.new(
    score: row[38].to_i,
    details: row[39] )
  rs_scoring.farm = farm
  rs_scoring.criterion = Criterion.find_by(name: 'Responsabilite sociale')
  rs_scoring.save!

  # ------------------- SOCIAL SCORING -------------------

  ali_scoring = Scoring.new(
    score: row[40].to_i,
    details: row[41] )
  ali_scoring.farm = farm
  ali_scoring.criterion = Criterion.find_by(name: 'Alimentation')
  ali_scoring.save!

  col_scoring = Scoring.new(
    score: row[80].to_i,
    details: row[81] )
  col_scoring.farm = farm
  col_scoring.criterion = Criterion.find_by(name: 'Collaboration')
  col_scoring.save!

  dec_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  dec_scoring.farm = farm
  dec_scoring.criterion = Criterion.find_by(name: 'Déchets')
  dec_scoring.save!

  dev_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  dev_scoring.farm = farm
  dev_scoring.criterion = Criterion.find_by(name: 'Développement local')
  dev_scoring.save!

  edu_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  edu_scoring.farm = farm
  edu_scoring.criterion = Criterion.find_by(name: 'Education')
  edu_scoring.save!

  eth_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  eth_scoring.farm = farm
  eth_scoring.criterion = Criterion.find_by(name: 'Ethique et développement humain')
  eth_scoring.save!

  hs_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  hs_scoring.farm = farm
  hs_scoring.criterion = Criterion.find_by(name: 'Hygiène et sécurité')
  hs_scoring.save!

  trs_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  trs_scoring.farm = farm
  trs_scoring.criterion = Criterion.find_by(name: 'Transparence')
  trs_scoring.save!

  # ------------------- ENV SCORING -------------------

  biod_scoring = Scoring.new(
    score: row[114].to_i,
    details: row[115] )
  biod_scoring.farm = farm
  biod_scoring.criterion = Criterion.find_by(name: 'Biodiversité')
  biod_scoring.save!
 
  cult_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  cult_scoring.farm = farm
  cult_scoring.criterion = Criterion.find_by(name: 'Culture')
  cult_scoring.save!

  elev_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  elev_scoring.farm = farm
  elev_scoring.criterion = Criterion.find_by(name: 'Elevage')
  elev_scoring.save!

  fert_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  fert_scoring.farm = farm
  fert_scoring.criterion = Criterion.find_by(name: 'Fertilisation')
  fert_scoring.save!

  prodphy_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  prodphy_scoring.farm = farm
  prodphy_scoring.criterion = Criterion.find_by(name: 'Produits phytosanitaires')
  prodphy_scoring.save!

  ressair_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  ressair_scoring.farm = farm
  ressair_scoring.criterion = Criterion.find_by(name: 'Ressources - Air')
  ressair_scoring.save!
  
  resseau_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  resseau_scoring.farm = farm
  resseau_scoring.criterion = Criterion.find_by(name: 'Ressources - Eau')
  resseau_scoring.save!
  
  ressene_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  ressene_scoring.farm = farm
  ressene_scoring.criterion = Criterion.find_by(name: 'Ressources - Energie')
  ressene_scoring.save!

  sol_scoring = Scoring.new(
    score: row[142].to_i,
    details: row[143] )
  sol_scoring.farm = farm
  sol_scoring.criterion = Criterion.find_by(name: 'Sol')
  sol_scoring.save!

  # ------------------- ECONOMIC SCORING -------------------

  effglo_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  effglo_scoring.farm = farm
  effglo_scoring.criterion = Criterion.find_by(name: 'Efficience globale')
  effglo_scoring.save!

  inde_scoring = Scoring.new(
    score: row[198].to_i,
    details: row[199] )
  inde_scoring.farm = farm
  inde_scoring.criterion = Criterion.find_by(name: 'Indépendance économique')
  inde_scoring.save!

  pere_scoring = Scoring.new(
    score: row[170].to_i,
    details: row[171] )
  pere_scoring.farm = farm
  pere_scoring.criterion = Criterion.find_by(name: 'Pérennité')
  pere_scoring.save!
  
  viaeco_scoring = Scoring.new(
    score: rand(40..100),
    details: "" )
  viaeco_scoring.farm = farm
  viaeco_scoring.criterion = Criterion.find_by(name: 'Viabilité économique')
  viaeco_scoring.save!
end

superuser = User.new(
  email: "mauriac@biocoop.com", 
  password: "123456",
  admin: true )
superuser.first_name = 'Marcel'
superuser.last_name = 'Mauriac'
superuser.phone_number = '02 38 46 94 45'
superuser.save!

puts "Users and Farms have been created"


puts "\nInserting Lists and Shops ..."

User.all.each do |user| 
  magazin = Shop.new
  magazin.address = "#{user.id} rue du General de Gaulle, 44300 Nantes"
  magazin.user = user
  magazin.save!
  3.times do
    maListe = List.new
    maListe.name = "Mes meilleurs fermiers #{(1..50).to_a.sample}"
    maListe.shop = magazin
    maListe.save!
  end
end

puts "Lists and Shops created"


puts "\nInserting Likes ..."

List.all.each do |liste| 
  (1..10).to_a.sample.times do
    coeur = Like.new
    coeur.list = liste
    coeur.farm = Farm.all.sample
    coeur.save!
  end
end

puts "Likes created"


puts "\nCreating Claps ..."

20.times do 
  clap = Clap.new
  clap.farm = Farm.all.sample
  clap.user = User.all.sample
  clap.save!
end
  
puts "#{Clap.count} Claps created"


puts "\nCreating Tags on farms ..."

tab_tag = ['Légumes', 'Fruits', 'Viande', 'Crèmerie', 'Vin']

Farm.all.each do |f|
  (1..3).to_a.sample.times do 
    f.tag_list.add(tab_tag.sample)
    f.save!
  end
end
  
puts "Tags added"


puts "\nAdding chatrooms and messages ..."

User.all.each do |u| 
    discut = Chatroom.new()
    discut.user_id = u.id
    discut.farm_id = Farm.all.sample.id
    discut.save!
    mes1 = Message.new()
    mes1.chatroom_id = discut.id
    mes1.user_id = u.id
    mes1.content = "Bonjour, comment allez-vous ? J'ai vu vos produits sur Ecofarms et j'aimerais travailler avec vous"
    mes1.save!
    mes2 = Message.new()
    mes2.chatroom_id = discut.id
    mes2.user_id = u.id
    mes2.content = "Merci pour votre message vocal."
    mes2.save!
end

puts "Chatrooms and messages added"

puts "\nFinished!"
