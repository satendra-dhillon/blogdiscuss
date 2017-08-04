# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name: "Satendra", last_name: "Dhillon", user_name: "satendra", phone_number: "9899999999", email: "satendra@gmail.com", password: "111111")
User.create(first_name: "Vishal", last_name: "Tyagi", user_name: "vishal", phone_number: "9999999999", email: "vishal@gmail.com", password: "111111")


(1..5).each do |i|
	Category.create(name: "Category #{i}")
end

Category.all.each_with_index do |cat, index|
	cat.blogs.create(title: "Blog #{index}", description: "Blog for #{cat.name}", blogger: User.first)
end

Blog.all.each_with_index do |blog, index|
	blog.comments.create(body: "Comment for #{blog.title} {index}", commenter: User.first)
	blog.comments.create(body: "Comment for #{blog.title} {index + 1}", commenter: User.last)
end