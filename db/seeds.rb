# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'Cleaning database...'

Farm.destroy_all
User.destroy_all
Category.destroy_all
Criterion.destroy_all
Scoring.destroy_all


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

puts 'categories have been created'

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
    password: random_password(length=10))
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
  
  aut_scoring = Scoring.new(
    score: row[30].to_i,
    details: row[31] )
  aut_scoring.farm = farm
  aut_scoring.criterion = Criterion.find_by(name: 'Autonomie')
  aut_scoring.save!
  
  # cp_scoring = Scoring.new(
  #   score: row[32].to_i,
  #   details: row[33] )
  # cp_scoring.farm = farm
  # cp_scoring.criterion = Criterion.where(name: 'Capacite productive')
  # cp_scoring.save!

  # rob_scoring = Scoring.new(
  #   score: row[34].to_i,
  #   details: row[35] )
  # rob_scoring.farm = farm
  # rob_scoring.criterion = Criterion.where(name: 'Robustesse')
  # rob_scoring.save!

  # anc_scoring = Scoring.new(
  #   score: row[36].to_i,
  #   details: row[37] )
  # anc_scoring.farm = farm
  # anc_scoring.criterion = Criterion.where(name: 'Ancrage territorial')
  # anc_scoring.save!

  # rs_scoring = Scoring.new(
  #   score: row[38].to_i,
  #   details: row[39] )
  # rs_scoring.farm = farm
  # rs_scoring.criterion = Criterion.where(name: 'Responsabilite sociale')
  # rs_scoring.save!

  # ali_scoring = Scoring.new(
  #   score: row[40].to_i,
  #   details: row[41] )
  # ali_scoring.farm = farm
  # ali_scoring.criterion = Criterion.where(name: 'Alimentation')
  # ali_scoring.save!

  # col_scoring = Scoring.new(
  #   score: row[81].to_i,
  #   details: row[82] )
  # col_scoring.farm = farm
  # col_scoring.criterion = Criterion.where(name: 'Collaboration')
  # col_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Déchets')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Développement local')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Education')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Ethique et développement humain')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Hygiène et sécurité')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Transparence')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Autonomie')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Autonomie')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Autonomie')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Autonomie')
  # aut_scoring.save!

  # aut_scoring = Scoring.new(
  #   score: row[30].to_i,
  #   details: row[31] )
  # aut_scoring.farm = farm
  # aut_scoring.criterion = Criterion.where(name: 'Autonomie')
  # aut_scoring.save!
end

puts "Users and Farms have been created"

puts "\nFinished!"
