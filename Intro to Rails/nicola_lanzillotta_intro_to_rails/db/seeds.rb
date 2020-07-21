# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Creating Houses"
house1 = House.create(address: "House Stark")
house2 = House.create(address: "House Barathion")

p "Creating People"
person1 = Person.create(name: "John Snow", house_id: house1.id)
person2 = Person.create(name: "Robert Barathion", house_id: house2.id)