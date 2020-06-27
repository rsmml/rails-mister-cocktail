require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning up DB'
Ingredient.destroy_all
puts 'Ingredients clen'

puts 'Creating Some ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read

ingredients = JSON.parse(json)

ingredients['drinks'].each do |ingredient|
  names = Ingredient.create(name: ingredient['strIngredient1'])
  puts "Ingredient #{names.name} was added"
end

puts 'Done, ready to make some summer cocktails :) !!!'

# # Ingredient.create(name: "lemon")
# # Ingredient.create(name: "ice")
# # Ingredient.create(name: "mint leaves")
