# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.where(nom: "Clients").first_or_create(nom: "Clients")
Category.where(nom: "Fournisseurs").first_or_create(nom: "Fournisseurs")
Category.where(nom: "Autres").first_or_create(nom: "Autres")


User.where(email: "marouan@gmail.com").first_or_create(email: "marouan@gmail.com" , password: "12345678", nom: Faker::Company.name, siteweb: Faker::Internet.url, admin: true)
User.where(email: "marouan1@gmail.com").first_or_create(email: "marouan1@gmail.com" , password: "12345678", nom: Faker::Company.name,  siteweb: Faker::Internet.url)
User.where(email: "marouan2@gmail.com").first_or_create(email: "marouan2@gmail.com" , password: "12345678", nom: Faker::Company.name,  siteweb: Faker::Internet.url)

25.times do 
	Post.create(titre: Faker::Name.title,
				description: Faker::Lorem.paragraph,
				category_id: rand(1..3),
				user_id: rand(1..3))
end


200.times do 
	Comment.create(commentaire: Faker::Lorem.paragraph,
				   post_id: rand(1..25),
				   user_id: rand(1..3))
end