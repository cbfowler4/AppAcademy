# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Band.destroy_all
Album.destroy_all


u1 = User.create!(email: "guitarboy@gmail.com", name: "Bryan Fowler", password: "123456")
u2 = User.create!(email: "bryan@gmail.com", name: "Abraham Lincoln", password: "123456")
u3 = User.create!(email: "hairball@gmail.com", name: "Pablo Escobar", password: "123456")

b1 = Band.create!(name: "N.W.A")
b2 = Band.create!(name: "David Bowie")
b3 = Band.create!(name: "The Shins")
b4 = Band.create!(name: "Liz Proteau")
b5 = Band.create!(name: "Daft Punk")

a1 = Album.create!(band_id: b1.id, title: "Straight Outta Compton", year: 1993, studio: true)
a2 = Album.create!(band_id: b2.id, title: "Heroes", year: 1979, studio: true)
a3 = Album.create!(band_id: b3.id, title: "Chutes Too Narrow", year: 2008, studio: false)
a4 = Album.create!(band_id: b4.id, title: "Aerobics", year: 2017, studio: true)
a5 = Album.create!(band_id: b5.id, title: "Random Access Memories", year: 2008, studio: false)

