# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all 

c1 = Cat.create!(birth_date: '2015/01/20', color: 'red', name: 'whiskers', sex: 'm', description: 'grumpy')
c2 = Cat.create!(birth_date: '2016/02/20', color: 'yellow', name: 'samuel', sex: 'm', description: 'sad')
c3 = Cat.create!(birth_date: '2011/05/23', color: 'green', name: 'tanya', sex: 'f', description: 'fierce')
c4 = Cat.create!(birth_date: '1999/01/08', color: 'white', name: 'jimbo', sex: 'f', description: 'happy')

cr1 = CatRentalRequest.create(cat_id: c1.id,start_date: '2015/01/20', end_date: '2015/01/25')
cr2 = CatRentalRequest.create(cat_id: c1.id,start_date: '2016/01/20', end_date: '2016/01/25')
cr3 = CatRentalRequest.create(cat_id: c2.id,start_date: '2015/01/20', end_date: '2015/01/25')
cr4 = CatRentalRequest.create(cat_id: c3.id,start_date: '2015/01/20', end_date: '2015/01/25')
cr5 = CatRentalRequest.create(cat_id: c3.id,start_date: '2016/01/20', end_date: '2016/01/25')


