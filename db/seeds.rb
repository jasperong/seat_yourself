# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Category.destroy_all

Category.create(cuisine: "American")
Category.create(cuisine: "Indian")
Category.create(cuisine: "Chinese")
Category.create(cuisine: "Italian")
Category.create(cuisine: "Japanese")
