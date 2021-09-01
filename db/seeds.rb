# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "start seeding.. creating 10 venues"
puts "destroying EVERYTHING"
Booking.destroy_all
Venue.destroy_all
User.destroy_all
puts "EVERYTHING DESTROYED"


cities = ["Eixample", "Sabadell", "Raval", "Martorell", "Sant Antoni", "Castelldefels", "Born", "Sants", "Badalona", "Barceloneta"]
10.times do
  test_user = User.create!(email: Faker::Internet.email,
                         password: "password",
                         first_name: Faker::Fantasy::Tolkien.character,
                         last_name: "test_last")

  img_avatar = URI.open("https://thispersondoesnotexist.com/image")
  test_user.avatar.attach(io: img_avatar, filename: 'avatar.png',content_type: 'image/png' )

  test_venue = Venue.create!(title: Faker::Address.full_address ,
                        location: cities.pop,
                        capacity: rand(10..125),
                        price: rand(1..20)*10,
                        user: test_user)

  img_party = URI.open("https://source.unsplash.com/1600x900/?party")
  test_venue.photos.attach(io: img_party, filename: 'venue.png', content_type: 'image/png')
  test_venue.save
  sleep(2)
end


puts "you just created #{Venue.count} fake Venues and #{User.count} fake users"
