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

def random_google_coordinates
  addy = nil
  while addy == nil
    first_coord = 23.767368 - (1..20).to_a.sample
    second_coord = 80.18930 - (1..60).to_a.sample
    addy = Geocoder.address([first_coord, second_coord])
  end
  addy
end

def random_cambdia_city
  ['Battambang', 'Kampong Cham', 'Kanpong Chhnang', 'Sihanoukville', 'Kampong Speu', 'Kampong Thorn', 'Kampot', 'Koh Kong', 'Kratie', 'Mongkol Borei', 'Neak Leung', 'Pailin', 'Poipet', 'Prey Veng', 'Siem Reap', 'Sisophon', 'Ta Khmau', 'Takeo', 'Thmar Kol'].sample
end

def random_email
  %w[Elwanda Roff Trinh Manfredi Matilda Mazon Francisco Wendell Timika Garand Russ Harms Kathe Byron Alma Kott Alexis Westerfield Merilyn Blakeney Jasmin Bruns Ned Leiva Kristie Bartos Rueben Krupa Myung Reddington Regine Ferron Adrianne Gruner Aimee Prendergast Riley Paladino Maisha Farnsworth].sample +
  "@" + %w[gmail.com hotmail.com aol.com netscape.com yahoo.com trustmail.com night.com].sample
end

def random_photo
  "profile" + (1..21).to_a.sample.to_s + ".jpg"
end

def get_random_user
  User.all.sample.id
end

12.times do
  User.create(name: random_name, email: random_email, password: "abc123")
end

32.times do
  Person.create(name: random_name, age: random_age, location: random_google_coordinates, photo_url: random_photo, user_id: get_random_user)
end

# Homeless Dan
Person.create(name: "Dan", age: 29, location: "1234 K Town", photo_url: "profile22.jpg", user_id: get_random_user)

Person.create(name: "Homeless Dan", age: 29, location: "1234 South K Town", photo_url: "profile23.jpg", user_id: get_random_user)

Person.create(name: "Captain Dan", age: 29, location: "36 Spooner St., North Korea", photo_url: "profile24.jpg", user_id: get_random_user)
