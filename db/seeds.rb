# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

#ingredients
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = JSON.parse(open(url).read)

drinks['drinks'].each do |i|
  Ingredient.create(name: i['strIngredient1'])
end

#cocktails
url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'
cocktails = JSON.parse(open(url).read)

cocktails['drinks'].each do |i|
  8.times do Cocktail.create(name: i['strDrink'])
  end
end
