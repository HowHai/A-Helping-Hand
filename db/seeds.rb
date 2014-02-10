# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Person.destroy_all
User.destroy_all

def random_name
  %w[Elwanda Roff Trinh Manfredi Matilda Mazon Francisco Wendell Timika Garand Russ Harms Kathe Byron Alma Kott Alexis Westerfield Merilyn Blakeney Jasmin Bruns Ned Leiva Kristie Bartos Rueben Krupa Myung Reddington Regine Ferron Adrianne Gruner Aimee Prendergast Riley Paladino Maisha Farnsworth].sample
end

def random_age
  (1..100).to_a.sample
end

def random_city
  ['Agoura Hills', 'Corona del Mar', 'Joshua Tree', 'Ojai', 'La Verne', 'Lake City', 'Duarte', 'Downey', 'Edwards', 'El Cajon', 'Lake Tahoe', 'Pinole', 'Pomona', 'El Monte', 'Santa Monica', "Los Angeles", "Perris", 'Lakeside', 'Lake Almanor', 'Cutten', 'Danville', 'Del Mar', 'Covina', 'Costa Mesa', 'Cotati', 'Alamo', 'Alturas', 'Anderson'].sample
end

def random_email
  %w[Elwanda Roff Trinh Manfredi Matilda Mazon Francisco Wendell Timika Garand Russ Harms Kathe Byron Alma Kott Alexis Westerfield Merilyn Blakeney Jasmin Bruns Ned Leiva Kristie Bartos Rueben Krupa Myung Reddington Regine Ferron Adrianne Gruner Aimee Prendergast Riley Paladino Maisha Farnsworth].sample +
  "@" + %w[gmail.com hotmail.com aol.com netscape.com yahoo.com trustmail.com night.com].sample
end


12.times do
  User.create(name: random_name, email: random_email, password: "abc123")
end

12.times do
  Person.create(name: random_name, age: random_age, location: random_city)
end
