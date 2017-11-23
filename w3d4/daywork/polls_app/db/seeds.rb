# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

ted = User.create(username: 'Ted')
martha = User.create(username: 'Martha')
sara = User.create(username: 'Sara')
steve = User.create(username: 'Steve')
lydia = User.create(username: 'Lydia')

poll1 = Poll.create(title: 'Sharks', author_id: ted.id)
poll2 = Poll.create(title: 'Apps', author_id: martha.id)
poll3 = Poll.create(title: 'Bananas', author_id: lydia.id)

p1q1 = Question.create(text: 'What kind of sharks are there?', poll_id: poll1.id)
p2q1 = Question.create(text: 'What are the best apps?', poll_id: poll2.id)
p3q1 = Question.create(text: 'What is your opinion on them?', poll_id: poll3.id)

q1a1 = AnswerChoice.create(text: 'Good', question_id: p1q1.id) 
q1a2 = AnswerChoice.create(text: 'Evil', question_id: p1q1.id) 
q2a1 = AnswerChoice.create(text: 'Fast', question_id: p2q1.id) 
q2a2 = AnswerChoice.create(text: 'Slow', question_id: p2q1.id) 
q3a1 = AnswerChoice.create(text: 'Healthy', question_id: p3q1.id) 
q3a2 = AnswerChoice.create(text: 'Unhealthy', question_id: p3q1.id)

# a1r1 = Response.create(answer_choice_id: q3a1.id, respondent_id: ted.id)
# a2r1 = Response.create(answer_choice_id: q1a2.id, respondent_id: martha.id)
# a1r2 = Response.create(answer_choice_id: q1a1.id, respondent_id: lydia.id)
# a2r2 = Response.create(answer_choice_id: q1a2.id, respondent_id: steve.id)
# a2r3 = Response.create(answer_choice_id: q1a2.id, respondent_id: ted.id)
# a3r1 = Response.create(answer_choice_id: q2a1.id, respondent_id: lydia.id)
# a3r2 = Response.create(answer_choice_id: q2a2.id, respondent_id: steve.id)
# a4r1 = Response.create(answer_choice_id: q3a1.id, respondent_id: sara.id)
# a4r2 = Response.create(answer_choice_id: q3a2.id, respondent_id: martha.id)

