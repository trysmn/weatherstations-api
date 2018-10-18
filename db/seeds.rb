# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

puts "Cleaning the database..."
Weatherstation.destroy_all
puts "Done!"

puts "Creating all weatherstations..."
Weatherstation.create(name: "Wisley")
puts "Done!"

puts "Creating all climatedatas..."
CSV.foreach("#{Dir.pwd}/db/climate_data_csv.csv", headers: true) do |row|
  # use row here...
  # byebug
  Climatedata.create(max_temp: row[0].to_f, min_temp: row[1].to_f, mean_temp: row[2].to_f, total_rainfall: row[3].to_f, total_sunshine: row[4].to_f, month: row[5].to_i, year: row[6].to_i, weatherstation_id: Weatherstation.all.first.id)
end
puts "Done!"
