require 'faker'

if Product.all.empty?
  (1..50).each do |i|
    Product.create(
      name_product: Faker::Food.fruits,
      type_product: Faker::Food.dish,
      description: Faker::Food.description,
      price: rand(1000...4200)
    )
  end
end
