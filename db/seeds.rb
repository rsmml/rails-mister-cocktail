require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CLEANING DB
puts 'Cleaning up DB'
Ingredient.destroy_all
puts 'Ingredients clen'

puts 'Creating Some ingredients'

# INGREDIENTS:
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
ingredients = JSON.parse(json)

ingredients['drinks'].each do |ingredient|
  names = Ingredient.create(name: ingredient['strIngredient1'])
  puts "Ingredient #{names.name} was added"
end

# COCKTAILS:
# url_cocktails = 'https://gist.githubusercontent.com/renandanton/8d99dab65bf9fb5b4465ded7ab73a7df/raw/2c5e0480bd239f76b055bb09f236f365e1530634/cocktails.json'
# json_cocktails = open(url_cocktails).read
# cocktails = JSON.parse(json_cocktails)

# list = []
# cocktails['cocktails'].each do |cocktail|
#   list << cocktail['name']
# end

# list.slice(0, 5).each do |name|
#   cocktail_name = Cocktail.create(name: name)
#   puts "Cocktail #{cocktail_name.name} was added"
# end

puts 'Done, ready to make some summer cocktails :) !!!'
