# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Ingredient.destroy_all

puts "Creating ingredients..."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
list_parsed = JSON.parse(list_serialized)
ingredients = list_parsed['drinks']

ingredients.each do |ingredient|
  ingredient = ingredient['strIngredient1'].to_s
  Ingredient.create(name: ingredient)
end
puts "Ingredients created!"

# puts "Creating drinks..."

# url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save
