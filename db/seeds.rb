# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# REQUIRES
require "date"

# SEED VARIABLES
# users_qty = 12
pets_possible_species = ["dog", "cat", "rabbit", "donkey", "snake", "horse", "pig"]
pets_qty = 50
pets_max_age = 15
pets_min_max_reward = [10, 25]
sittings_per_pet_max_qty = 3

errors = 0
# pet_users = User.all.sample(2)

# FRONT END
def main_separator
  puts "\n\n" + "*" * 50 + "\n\n"
end

def alt_separator
  puts "\n" + "-" * 50 + "\n\n"
end

# START SEED
puts "Seeding started."

main_separator

# CLEAN DB
puts "Cleaning database..."
puts "-- Cleaning Sittings..."
Sitting.destroy_all
puts "--- Done."
alt_separator
puts "-- Cleaning Pets..."
Pet.destroy_all
puts "--- Done."
# alt_separator
# puts "-- Cleaning Users..."
# User.destroy_all
# puts "--- Done."
alt_separator
puts "\nDatabase is now clean."

# GENERATE USERS
# puts "Creating #{users_qty} users..."
# users_qty.times do
#   user = User.new
#   user.email = Faker::Internet.safe_email
#   user.password = 'password'
#   user.first_name = Faker::Name.first_name
#   user.last_name = Faker::Name.first_name
#   user.phone_number = Faker::PhoneNumber.phone_number_with_country_code
#   user.description = Faker::Hipster.sentence
#   user.street_address = Faker::Address.street_address
#   user.city = Faker::Address.city
#   user.postcode = Faker::Address.zip
#   user.country = Faker::Address.country
#   if user.valid?
#     user.save
#   else
#     p "Err: Can't save user."
#     errors += 1
#   end
# end


main_separator
puts "Creating #{pets_qty} pets..."
alt_separator

pets_qty.times do
  owner = User.all.sample
  sitters = []
  User.all.each do |sitter|
    if sitter == owner
      puts "Got owner out of sitters"
    else
      sitters << sitter
    end
  end
  pet = Pet.new
  pet.name = Faker::Creature::Cat.name
  pet.user = owner
  puts "- Creating #{pet.name} (belongs to #{owner})..."
  pet.description = Faker::Creature::Dog.meme_phrase
  pet.species = pets_possible_species.sample
  pet.age = rand(1..pets_max_age)
  pet.reward_per_day = rand(pets_min_max_reward[0]..pets_min_max_reward[1])
  pet.street_address = Faker::Address.street_address
  pet.city = Faker::Address.city
  pet.postcode = Faker::Address.zip
  pet.country = Faker::Address.country
  pet.save
  p "-- #{pet.name} :\n#{pet}\n\n"

  alt_separator

  sittings_for_this_pet = rand(1..sittings_per_pet_max_qty)
  puts "Creating #{sittings_for_this_pet} sittings for #{pet.name}..."
  sitting_index = 0
  sittings_for_this_pet.times do
    puts "Sitting number #{sitting_index}..."
    sitting = Sitting.new
    p pet
    sitting.pet = pet
    sitting.user = sitters.sample
    sitting.start_date = Date.today
    sitting.end_date = Date.today + 1
    sitting.message = Faker::Hipster.sentence
    puts "-- #{sitting.user} for #{sitting.pet} (#{sitting.start_date} - #{sitting.end_date}):\n#{sitting.message}..."
    sitting.save
  end
end

puts "END OF SEED - #{errors} error(s)."