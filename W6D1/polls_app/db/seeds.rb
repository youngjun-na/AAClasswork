# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

harry = User.create(username: 'harrypotter')
ron = User.create(username: 'ronweasley')
hermione = User.create(username: 'mudbl00d')
malfoy = User.create(username: 'draco')
gandalf = User.create(username: 'therealwizard')

poll1 = Poll.create(author_id: harry.id, title: "Wizarding 101")
poll2 = Poll.create(author_id: gandalf.id, title: "Lord of the Rings")

question1 = Question.create(poll_id: 1, text: "What is your favorite color?")
question2 = Question.create(poll_id: 1, text: "Do you like candy?")
question3 = Question.create(poll_id: 2, text: "Who killed Roger Rabbit?")
question4 = Question.create(poll_id: 2, text: "Am I the walrus?")

answer_choice1 = AnswerChoice.create(question_id: 1,text: "Blue")
answer_choice2 = AnswerChoice.create(question_id: 1,text: "Your blood")
answer_choice3 = AnswerChoice.create(question_id: 2,text: "No")
answer_choice4 = AnswerChoice.create(question_id: 3,text: "He who must not be named")
answer_choice5 = AnswerChoice.create(question_id: 3,text: "Bugs Bunny")
answer_choice6 = AnswerChoice.create(question_id: 4,text: "Goo goo g'joob")
answer_choice7 = AnswerChoice.create(question_id: 4,text: "Overrated song")

response1 = Response.create(user_id: 2, answer_choice_id: 1)
response2 = Response.create(user_id: 1, answer_choice_id: 2)
response3 = Response.create(user_id: 3, answer_choice_id: 3)
response4 = Response.create(user_id: 4, answer_choice_id: 4)
response5 = Response.create(user_id: 5, answer_choice_id: 5)
response6 = Response.create(user_id: 2, answer_choice_id: 6)
response7 = Response.create(user_id: 4, answer_choice_id: 7)