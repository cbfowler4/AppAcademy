# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ShortenedUrl.destroy_all
TagTopic.destroy_all
Tagging.destroy_all
Visit.destroy_all

a = User.create!({email: "a@a.com"})
b = User.create!({email: "b@b.com"})
c = User.create!({email: "c@c.com"})
d = User.create!({email: "d@d.com"})
e = User.create!({email: "e@e.com"})
f = User.create!({email: "f@f.com"})

sa = ShortenedUrl.random_code(a, "aaa")
sb = ShortenedUrl.random_code(b, "bbb")
sc = ShortenedUrl.random_code(c, "ccc")
sd = ShortenedUrl.random_code(d, "ddd")
se = ShortenedUrl.random_code(e, "eee")
sf = ShortenedUrl.random_code(f, "fff")

ta = TagTopic.create!(topic: "three letters")
tb = TagTopic.create!(topic: "search engine")

Tagging.create!(tag_topic_id: ta.id, shortened_url_id: sa.id)
Tagging.create!(tag_topic_id: ta.id, shortened_url_id: sc.id)
Tagging.create!(tag_topic_id: ta.id, shortened_url_id: sb.id)
Tagging.create!(tag_topic_id: ta.id, shortened_url_id: se.id)
Tagging.create!(tag_topic_id: ta.id, shortened_url_id: sf.id)
Tagging.create!(tag_topic_id: ta.id, shortened_url_id: sd.id)
Tagging.create!(tag_topic_id: tb.id, shortened_url_id: sa.id)
Tagging.create!(tag_topic_id: tb.id, shortened_url_id: sc.id)
Tagging.create!(tag_topic_id: tb.id, shortened_url_id: sb.id)
