# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

15.times do |i|
	name = Faker::Name.name
	email_address = Faker::Internet.email
	password = "test123"
	new_user = User.create(name: name, 
							 					 email_address: email_address,
							 					 password: password)

	new_user.save
	
	5.times do |j|
		user = new_user
		title = Faker::Commerce.product_name
		description = Faker::Lorem.sentence(3)
		deadline = Faker::Date.forward(60)
		minimum_bid = Faker::Number.positive(10, 50)

		new_product = Product.create(user: user, 
																 title: title, 
																 description: description, 
																 deadline: deadline,
																 minimum_bid: minimum_bid)

		new_product.save
	end
end