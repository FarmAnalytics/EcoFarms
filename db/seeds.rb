# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'Cleaning database...'
Farm.destroy_all
User.destroy_all

puts 'Parsing the csv...'

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

  puts "User created"

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

  puts "Farm created"

  category = Category.new(
    name: row[],
    method: row[],
    score: row[],
    perspective: row[],
    interet: row[] )
  category.save!

  criterion = Criterion.new(
    name: row[],
    details: row[] )
  criterion.category = category
  criterion.save!

  scoring = Scoring.new(
    score: row[],
    details: row[] )
  scoring.farm = farm
  scoring.criterion = criterion
  scoring.save!
end

puts "Finished!"
