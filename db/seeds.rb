# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.delete_all
Film.delete_all
Category.delete_all
Review.delete_all
Comment.delete_all

users = 20.times.map do
  User.create!( :username     => Faker::Name.name,
                :email        => Faker::Internet.email,
                :password_digest     => 'password',
                :judge_status => false)
end

judges = 12.times.map do
  User.create!( :username     => Faker::Name.name,
                :email        => Faker::Internet.email,
                :password_digest     => 'password',
                :judge_status => true)
end

films = 50.times.map do
  Film.create!( :title        => Faker::Superhero.power,
                :description  => Faker::StarWars.quote,
                :writers      => Faker::Name.name,
                :actors       => Faker::Superhero.name,
                :category_id => rand(1..6),
                :director     => Faker::StarWars.character)

end

reviews = 100.times.map do
  Review.create!(:title      => Faker::Hipster.sentence(1),
                  :body        => Faker::Hipster.paragraph(3, 5),
                  :star_value => rand(1..5),
                  :user_id    => rand(1..30),
                  :film_id    => rand(1..50)  )

end

comments = 50.times.map do
  Comment.create!(:body          => Faker::Shakespeare.hamlet_quote,
                 :user_id       => rand(1..30),
                 :review_id   => rand(1..100)  )
end


Category.create(name:"Magical-Realism")
Category.create(name:"Film-Noir")
Category.create(name:"Animation")
Category.create(name:"Comedy")
Category.create(name:"Drama")
Category.create(name:"Urban Adventure")

