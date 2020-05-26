# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# require 'csv'

# puts 'Cleaning database...'
# Farm.destroy_all

# puts 'Parsing the seed...'
# # csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# # filepath    = 'seeds.csv'
# load_farms('seeds.csv')

# puts "Finished!"

# private

# def true?(obj)
#   obj.to_s.downcase == "true"
# end

# def load_farms(file_path)
#   farms = []
#   categories = ["Score global"]
#   criterions = ["global"]
#   scoring = []
#   CSV.foreach(file_path) do |row|
#     farms << { name: row[0], address: row[1], sector: row[3], private: true?(row[4]), description: row[5], url: row[10], cultures: row[13], surface: row[14].to_i, employees: row[15].to_i }
#     scoring << { criterions_id: categories[0],  score: row[19] }
#   end
  
#   category = Category.new(
    
#   )
#   category.save

# end



# #   user = User.new(
# #     password: "alpha0101",
# #     first_name: 'Elon',
# #     last_name: 'Musk',
# #     phone_number: '0150504545',
# #     email: 'elonm94@mail.com')  
# #   user.save
# #   puts "User #{user.email} created"

# # 20.times do

# #   plug = Plug.new(
# #       address: a.sample,
# #       power: [16, 30, 40, 70].sample,
# #       ac_dc: ["AC", "DC"].sample,
# #       type_plug: ['Type 2', 'Type 3C', 'Type 1', 'CHAdeMO', 'Combo CCS', 'P17' ].sample,
# #       price: rand(8..20)
# #   )
 
# #     plug.user = user
# #     plug.save!
# #     puts "Plug \"#{plug.type_plug} - #{plug.power}\"created"

# # end

# # puts'Creating bookings...'
# # 20.times do 
# #   booking = Booking.new 
# #   booking.user = User.all.sample 
# #   plug = Plug.all.sample
# #   booking.plug = plug
# #   puts "Booking for #{booking.user} created"
# # end
