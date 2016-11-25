# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Dose.destroy_all
# Ingredient.destroy_all
# Cocktail.destroy_all

Cocktail.create!(name: "Mint Julep")
Cocktail.create!(name: "Whiskey Sour")
Cocktail.create!(name: "Mojito")

Ingredient.create!(name: "lemon")
Ingredient.create!(name: "ice")
Ingredient.create!(name: "mint leaves")


# dose            = Dose.new(description: "1")
# dose.ingredient = Ingredient.find(1)
# dose.cocktail   = Cocktail.find(3)
# dose.save

Dose.create!(description: "1", ingredient_id: 1, cocktail_id: 3)
Dose.create!(description: "3", ingredient_id: 2, cocktail_id: 3)
Dose.create!(description: "10", ingredient_id: 3, cocktail_id: 3)
