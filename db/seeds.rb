# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

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
CSV.foreach('db/seeds.csv') do |row|

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
    score: rand(20..90),
    details: "" )
  dec_scoring.farm = farm
  dec_scoring.criterion = Criterion.find_by(name: 'Déchets')
  dec_scoring.save!

  dev_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  dev_scoring.farm = farm
  dev_scoring.criterion = Criterion.find_by(name: 'Développement local')
  dev_scoring.save!

  edu_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  edu_scoring.farm = farm
  edu_scoring.criterion = Criterion.find_by(name: 'Education')
  edu_scoring.save!

  eth_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  eth_scoring.farm = farm
  eth_scoring.criterion = Criterion.find_by(name: 'Ethique et développement humain')
  eth_scoring.save!

  hs_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  hs_scoring.farm = farm
  hs_scoring.criterion = Criterion.find_by(name: 'Hygiène et sécurité')
  hs_scoring.save!

  trs_scoring = Scoring.new(
    score: rand(20..90),
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
    score: rand(20..90),
    details: "" )
  cult_scoring.farm = farm
  cult_scoring.criterion = Criterion.find_by(name: 'Culture')
  cult_scoring.save!

  elev_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  elev_scoring.farm = farm
  elev_scoring.criterion = Criterion.find_by(name: 'Elevage')
  elev_scoring.save!

  fert_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  fert_scoring.farm = farm
  fert_scoring.criterion = Criterion.find_by(name: 'Fertilisation')
  fert_scoring.save!

  prodphy_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  prodphy_scoring.farm = farm
  prodphy_scoring.criterion = Criterion.find_by(name: 'Produits phytosanitaires')
  prodphy_scoring.save!

  ressair_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  ressair_scoring.farm = farm
  ressair_scoring.criterion = Criterion.find_by(name: 'Ressources - Air')
  ressair_scoring.save!
  
  resseau_scoring = Scoring.new(
    score: rand(20..90),
    details: "" )
  resseau_scoring.farm = farm
  resseau_scoring.criterion = Criterion.find_by(name: 'Ressources - Eau')
  resseau_scoring.save!
  
  ressene_scoring = Scoring.new(
    score: rand(20..90),
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
    score: rand(20..90),
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
    score: rand(20..90),
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

superuser2 = User.new(
  email: "bertrand@biocoop.com", 
  password: "123456",
  admin: true )
superuser2.first_name = 'Bertrand'
superuser2.last_name = 'Vazy'
superuser2.phone_number = '02 38 46 94 45'
superuser2.save!

FermeGally = Farm.find(14)
FermeGally.user = superuser2
FermeGally.save!

ChatGally = Chatroom.new
ChatGally.farm = FermeGally
ChatGally.user = superuser
ChatGally.save!

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
