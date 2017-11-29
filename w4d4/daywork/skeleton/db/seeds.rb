# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all
User.destroy_all

u1 = User.create!({user_name: 'hairball', password: '123456'})
u2 = User.create!({user_name: 'catlover', password: '123456'})
u3 = User.create!({user_name: 'catman', password: '123456'})

c1 = Cat.create!(birth_date: '2016/01/01', color: 'black', name: 'Whiskers', sex: 'M', user_id: u1.id)
c2 = Cat.create!(birth_date: '2016/02/01', color: 'brown', name: 'Bruiser', sex: 'M', user_id: u1.id)
c3 = Cat.create!(birth_date: '2016/03/01', color: 'orange', name: 'Spike', sex: 'M', user_id: u1.id)
