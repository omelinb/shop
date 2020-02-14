Product.delete_all
names = %w[First Second Third Fourth]
names.each do |name|
  Product.create(
    name: "#{name} product",
    description: "Description of our #{name} product",
    price: rand(5.00..50.00)
  )
end
