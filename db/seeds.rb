# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# need create an admin account
User.create(email:"admin@gmail.com", name:"test admin", password: "123", admin: true)

#Write also fake users and tasks
User.create(email:"test@gmail.com", name:"test user", password: "123")



