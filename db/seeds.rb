# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'

Recipe.destroy_all

puts 'Creating recipes...'

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
