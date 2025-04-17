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

# Clear existing data
puts "Clearing existing data..."
InventoryTransaction.destroy_all
ProductAttribute.destroy_all
ProductImage.destroy_all
Product.destroy_all
Category.destroy_all

# Create Categories
puts "Creating categories..."
10.times do
  Category.create!(
    name: Faker::Commerce.unique.department,
    description: Faker::Lorem.paragraph
  )
end

# Create Products
puts "Creating products..."
categories = Category.all
50.times do
  product = Product.create!(
    name: Faker::Commerce.unique.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: Faker::Commerce.price(range: 10..1000.0),
    quantity: Faker::Number.between(from: 100, to: 200),
    category: categories.sample
  )

  # Add product images (1-5 per product)
  puts "Adding images for product: #{product.name}"
  rand(1..5).times do
    ProductImage.create!(
      product: product,
      image_url: Faker::LoremFlickr.image(size: "800x600", search_terms: [ 'product', product.category.name.downcase ]),
      is_primary: false
    )
  end

  # Add product attributes (0-8 per product)
  puts "Adding attributes for product: #{product.name}"
  attribute_count = rand(10..30)

  # Conditional attributes based on category
  case product.category.name.downcase
  when /electronics|computer|tech/i
    ProductAttribute.create!(product: product, attribute_name: "Warranty", attribute_value: "#{rand(1..3)} years")
    ProductAttribute.create!(product: product, attribute_name: "Power", attribute_value: "#{rand(100..1000)}W") if attribute_count > 2
    ProductAttribute.create!(product: product, attribute_name: "Connectivity", attribute_value: [ "Bluetooth", "WiFi", "USB-C", "HDMI" ].sample) if attribute_count > 3
  when /clothing|apparel|fashion/i
    ProductAttribute.create!(product: product, attribute_name: "Material", attribute_value: Faker::Commerce.material)
    ProductAttribute.create!(product: product, attribute_name: "Size", attribute_value: [ "S", "M", "L", "XL", "XXL" ].sample) if attribute_count > 2
    ProductAttribute.create!(product: product, attribute_name: "Color", attribute_value: Faker::Color.color_name) if attribute_count > 3
  when /food|grocery|beverage/i
    ProductAttribute.create!(product: product, attribute_name: "Expiry", attribute_value: Faker::Date.forward(days: 365).to_s)
    ProductAttribute.create!(product: product, attribute_name: "Weight", attribute_value: "#{rand(50..1000)}g") if attribute_count > 2
    ProductAttribute.create!(product: product, attribute_name: "Allergens", attribute_value: [ "Nuts", "Dairy", "Gluten", "None" ].sample) if attribute_count > 3
  end

  # Add some generic attributes regardless of category
  general_attributes = [
    { name: "Brand", value: Faker::Company.name },
    { name: "Country of Origin", value: Faker::Address.country },
    { name: "SKU", value: Faker::Alphanumeric.alphanumeric(number: 8, min_alpha: 3, min_numeric: 3).upcase },
    { name: "Rating", value: "#{rand(1..5)}/5" },
    { name: "Package Contents", value: Faker::Lorem.sentence }
  ]

  # Add remaining attributes as generic ones, up to the attribute_count
  remaining_count = attribute_count - ProductAttribute.where(product: product).count
  general_attributes.sample(remaining_count).each do |attr|
    ProductAttribute.create!(
      product: product,
      attribute_name: attr[:name],
      attribute_value: attr[:value]
    )
  end

  # Create inventory transactions for each product (1-5 per product)
  puts "Adding inventory transactions for product: #{product.name}"
  transaction_count = rand(1..5)

  transaction_count.times do
    # Initial stock is always "purchase" type
    transaction_type = [ "purchase", "sale", "adjustment" ].sample
    quantity_change = case transaction_type
    when "purchase"
                        rand(5..50) # positive for purchases
    when "sale"
                        -rand(1..10) # negative for sales
    when "adjustment"
                        [ -1, 1 ].sample * rand(1..5) # can be positive or negative
    end

    InventoryTransaction.create!(
      product: product,
      quantity_change: quantity_change,
      transaction_type: transaction_type,
      notes: Faker::Lorem.sentence
    )
  end

  # Ensure at least one purchase transaction for each product
  if !InventoryTransaction.where(product: product, transaction_type: "purchase").exists?
    InventoryTransaction.create!(
      product: product,
      quantity_change: rand(10..100),
      transaction_type: "purchase",
      notes: "Initial stock"
    )
  end
end

puts "Seeding completed!"
puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"
puts "Created #{ProductImage.count} product images"
puts "Created #{ProductAttribute.count} product attributes"
puts "Created #{InventoryTransaction.count} inventory transactions"
