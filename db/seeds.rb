# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Category.destroy_all

Restaurant.create(name: "Mitch's Pizza", location: "15 King Street West", logo_url: "http://placekitten.com/100/100", site_url: "https://gentle-plains-55678.herokuapp.com", description: "Mitch's pizza is the best pizza! EVA!", phone: '647-666-6666', capacity: 30, open_hour: 9, close_hour: 18, category_id: '1')

Category.create(cuisine: "American")
Category.create(cuisine: "Indian")
Category.create(cuisine: "Chinese")
Category.create(cuisine: "Italian")
Category.create(cuisine: "Japanese")
