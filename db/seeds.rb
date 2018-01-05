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

 premium2 = User.create!(
   name: 'Premium User2',
   email: 'premium2@example.com',
   password: 'password',

   role: 'premium'
 )

 premium3 = User.create!(
   name: 'Premium User3',
   email: 'premium3@example.com',
   password: 'password',

   role: 'premium'
 )


 standard = User.create!(
   email: 'standard@example.com',
   password: 'password',
   role: 'standard'
 )


standard2 = User.create!(
  name: 'Standard User2',
  email: 'standard2@example.com',
  password: 'password',

  role: 'standard'
)

standard3 = User.create!(
  name: 'Standard User3',
  email: 'standard3@example.com',
  password: 'password',

  role: 'standard'
)


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} posts created"
