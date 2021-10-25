# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all


user = User.create(
  first_name: "lea",
  last_name: "lea",
  email: "lea@yopmail.com",
  password: "000000",
)

user = User.create(
  first_name: "louis",
  last_name: "louis",
  email: "louis@yopmail.com",
  password: "000000",
)

user = User.create(
  first_name: "alain",
  last_name: "alain",
  email: "alain@yopmail.com",
  password: "000000",
)

user = User.create(
  first_name: "roger",
  last_name: "roger",
  email: "roger@yopmail.com",
  password: "000000",
)

user = User.create(
  first_name: "teo",
  last_name: "teo",
  email: "teo@yopmail.com",
  password: "000000",
)