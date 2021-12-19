# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.destroy_all
# Blog.destroy_all
# Paragraph.destroy_all
# Image.destroy_all

user = User.create(firstname: "Kenny", lastname: "Nguyen", username: "admin", password: "admin", pfp:"https://i.imgur.com/igF2kHr.png")

blog = Blog.create(title: "Blog1", user: user)
blog2 = Blog.create(title: "Blog2", user: user)


Paragraph.create(heading: "Paragraph1 Head", content:"Hello World", subtext:"This is a paragraph", order: 1, blog:blog)
Image.create(heading: "Image1 Head", content:"Goodbye World", subtext:"This is an image", order: 2, blog:blog)
Paragraph.create(heading: "Paragraph2 Head", content:"Hello World 2", subtext:"This is a paragraph 2", order: 3, blog:blog)

Paragraph.create(heading: "Paragraph3 Head", content:"Hello World 3", subtext:"This is a paragraph 3", order: 1, blog:blog2)
Image.create(heading: "Image2 Head", content:"Goodbye World 2", subtext:"This is an image 2", order: 2, blog:blog2)
Paragraph.create(heading: "Paragraph4 Head", content:"Hello World 4", subtext:"This is a paragraph 4", order: 3, blog:blog2)
