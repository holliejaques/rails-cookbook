# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri' # reads an api
require 'json' # formats everything correctly

puts 'Cleaning database...'

Bookmark.destroy_all
Recipe.destroy_all

puts 'Creating recipes...'

url = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=seafood'

# The API will return a list
recipe = URI.parse(url).read
meals = JSON.parse(recipe)

# Define a new method
def recipe_builder(recipe_id)
  # inside method, api call to, give the api the id
  recipe_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{recipe_id}"
  recipe_json_data = URI.parse(recipe_url).read
  recipe_info = JSON.parse(recipe_json_data)
  # create new recipe instances with info we get back
  # recipe_builder method should then create a new recipe instance using the data from the response
  name = recipe_info['meals'][0]['strMeal']
  description = recipe_info['meals'][0]['strInstructions']
  image_url = recipe_info['meals'][0]['strMealThumb']
  Recipe.create!(name: name, description: description, image_url: image_url, rating: rand(0..10))
end

meals['meals'].each do |recipe|
  recipe_id = recipe['idMeal']
  # call method recipe_builder & pass id
  recipe_builder(recipe_id)
end

puts 'Created Seafood Recipes'

Recipe.create!(
  name: 'Beef Ramen',
  description: 'Easy Beef Ramen with veggies and a runny yolk egg, all in less than 40 minutes!',
  image_url: 'https://cdn-img.georgeforemangrills.com/manager/georgeforemangrills_com/recipes/large_Beef_Ramen.jpg',
  rating: 5.1
)

puts 'Created Pork Ramen'

Recipe.create!(
  name: 'Caprese Salad',
  description: "You'll LOVE this 5-ingredient Caprese salad that's easy to make.",
  image_url: 'https://www.seriouseats.com/thmb/5kQKbm3V-zgurSr95PTITqaS_vs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/classic-caprese-salad-recipe-hero-05_1-9ce2f9b0601c45279e07320f9548fa66.JPG',
  rating: 8.4
)

puts 'Created Caprese Salad'

Recipe.create!(
  name: 'Pad Thai',
  description: 'With just a few special ingredients, you can make this subtly sweet, tangy, nutty, and salty Thai dish',
  image_url: 'https://www.foodandwine.com/thmb/9Vb8WuiTba45J_7HEXV6M58bo2U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Shrimp-Pad-Thai-FT-RECIPE0324-3132ca704bc0457e836127dbda403368.jpg',
  rating: 7.2
)

puts 'Created Pad Thai'

Recipe.create!(
  name: 'Tacos al Pastor',
  description: 'The best and easiest homemade al pastor recipe: smoky, sweet, and super easy crispy edged tacos',
  image_url: 'https://www.simplyrecipes.com/thmb/3K4LQNFWWR3H62xa598c_XAYIQQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Tacos-Al-Pastor-Lead-04-429571d03db94ed1a8a24f8c2d351cec.jpg',
  rating: 4.3
)

puts 'Created Tacos al Pastor'

puts "Finished! Created #{Recipe.count} recipes!"
