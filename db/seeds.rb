# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "start seeding.. creates 6 venues"
puts "destroy all stuff"
Booking.destroy_all
Venue.destroy_all
User.destroy_all

test_user = User.create!(email: "abccxc@ab.com", password: "password", first_name:"test_user", last_name:"test_last")

6.times { |i|
  Venue.create!(title: "venue_#{i}", location: "locationXYZ", capacity: 125, price: 500, user: test_user)
}
puts "seeding done"

