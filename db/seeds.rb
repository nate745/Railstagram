# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User:
# vellka = User.new(email:"vellka@gamil.com", username:"vellka", password:"akllev")
# 

[1,2,3].each do |num|
    User.create(
      username:"user#{num}",
      email: "user#{num}@example.com",
      password: "test123"
    )
  end
   
  ["Nature", "NYC", "Art", "Humor"].each do |tag_name|
    Tag.create(name: tag_name)
  end
   
  url = "https://wallpapercave.com/wp/wp2269440.jpg"
  url_two = "https://www.thehappycatsite.com/wp-content/uploads/2018/03/norwegian-forest-cat-header.jpg"

   
  Post.create(
    image_url: url,
    title: "Polar Bear!",
    user_id: User.first.id
  )

  Post.create(
    image_url: url_two,
    title: "Cat!",
    user_id: User.second.id
  )