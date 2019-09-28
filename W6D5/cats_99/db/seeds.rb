# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ralph = Cat.create(name: "50cent",birth_date: "1992/04/07", color: "black", sex: "M")
ralph = Cat.create(name: "Eminem",birth_date: "1997/04/07", color: "white", sex: "M")
ralph = Cat.create(name: "DMX",birth_date: "1985/04/07", color: "black", sex: "M")
ralph = Cat.create(name: "JaRule",birth_date: "1987/04/07", color: "black", sex: "M")
ralph = Cat.create(name: "Vanilla Ice",birth_date: "1992/04/07", color: "white", sex: "M")
ralph = Cat.create(name: "Lil Wayne",birth_date: "1992/04/07", color: "black", sex: "M")
ralph = Cat.create(name: "Pusha T",birth_date: "1995/04/07", color: "black", sex: "M")
ralph = Cat.create(name: "Lil Kim",birth_date: "1993/04/07", color: "black", sex: "F")

request1 = CatRentalRequest.create(start_date: "2019/9/10",end_date: "2019/9/25", cat_id: 1, status: "APPROVED")
request2 = CatRentalRequest.create(start_date: "2019/9/10",end_date: "2019/9/25", cat_id: 2, status: "PENDING")

