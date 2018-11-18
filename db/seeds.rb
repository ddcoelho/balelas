# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "deleting"
User.destroy_all
Post.destroy_all
Comment.destroy_all
Review.destroy_all

puts "creating"

userCount = 0
10.times do
  userCount += 1
  email = "#{userCount.to_s}@email.com"
  password = "123654"
  User.create(email: email, password: password)
end

User.all.each do |user|
  3.times do
    title = Faker::SiliconValley.invention
    content = Faker::SiliconValley.quote
    Post.create(user_id: user.id, title: title, content: content)
  end
end

Post.all.each do |post|
  3.times do
    user = rand(0..User.count)
    content = Faker::SiliconValley.motto
    Comment.create(user_id: user, post_id: post.id, content: content )
  end
end

