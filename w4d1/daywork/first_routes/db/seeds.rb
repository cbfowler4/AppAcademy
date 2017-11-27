# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
ArtworkShare.destroy_all
Artwork.destroy_all

u1 = User.create!(username: 'kat')
u2 = User.create!(username: 'bryan')
u3 = User.create!(username: 'myke')

a1 = Artwork.create!(title: 'dogs', image_url: 'dogs.jpg', artist_id: u1.id)
a2 = Artwork.create!(title: 'cats', image_url: 'cats.jpg', artist_id: u2.id)
a3 = Artwork.create!(title: 'birds', image_url: 'birds.jpg', artist_id: u3.id)

s1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
s2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u3.id)
s3 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u1.id)


