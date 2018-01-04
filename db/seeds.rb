require 'faker'

 10.times do
   User.create!(
     email: Faker::Internet.email,
     password: 'helloworld',
   )
 end

 users = User.all

 100.times do
   wiki = Wiki.create!(
     user: users.sample,
     title: Faker::StarWars.character,
     body: Faker::StarWars.quote
   )
 end

 wikis = Wiki.all

 admin = User.create!(
   email: 'admin@example.com',
   password: 'password',
   role: 'admin'
 )

 premium = User.create!(
   email: 'premium@example.com',
   password: 'password',
   role: 'premium'
 )

 standard = User.create!(
   email: 'standard@example.com',
   password: 'password',
   role: 'standard'
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} posts created"
