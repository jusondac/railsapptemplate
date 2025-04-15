# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'faker'

Sale.delete_all

100.times do
  Sale.create!(
    product_name: Faker::Commerce.product_name,
    amount: rand(10..500),
    created_at: Faker::Date.between(from: 1.year.ago, to: Date.today)
  )
end

puts "Seeded #{Sale.count} fake sales!"
