# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(user_name: "miles", password: "password1")
user2 = User.create(user_name: "youngjun", password: "password1")
user3 = User.create(user_name: "paulrose", password: "password1")
user4 = User.create(user_name: "maxwell", password: "password1")
user5 = User.create(user_name: "asa", password: "password1")

ralph = Cat.create(name: "50cent",birth_date: "1992/04/07", color: "black", sex: "M", user_id: 1)
ralph1 = Cat.create(name: "Eminem",birth_date: "1997/04/07", color: "white", sex: "M", user_id: 2)
ralph2 = Cat.create(name: "DMX",birth_date: "1985/04/07", color: "black", sex: "M", user_id: 3)
ralph3 = Cat.create(name: "JaRule",birth_date: "1987/04/07", color: "black", sex: "M", user_id: 1)
ralph4 = Cat.create(name: "Vanilla Ice",birth_date: "1992/04/07", color: "white", sex: "M", user_id: 4)
ralph5 = Cat.create(name: "Lil Wayne",birth_date: "1992/04/07", color: "black", sex: "M", user_id: 2)
ralph6 = Cat.create(name: "Pusha T",birth_date: "1995/04/07", color: "black", sex: "M", user_id: 3)
ralph7 = Cat.create(name: "Lil Kim",birth_date: "1993/04/07", color: "black", sex: "F", user_id: 5)