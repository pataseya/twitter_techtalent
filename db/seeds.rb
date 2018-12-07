# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create some fake data for our project

# method to create user messages

  def create_messages(user)
    puts "Creating Messages for #{user.name}"
    5.times {
      putc "."
      Tweet.create!({
        message: Faker::FamousLastWords.last_words,
        user_id: user.id,
        created_at: Faker::Date.between(2.weeks.ago, Time.now),
        })
      }
    puts "Done"
  end

  # destroy messages to start fresh
  Tweet.destroy_all

  # first generate my users

  puts "Generating my user"
  u = User.find_or_create_by(username: "camper")

  u.update_attributes({
    email:    "twituser@user.com",
    username: "iamuser",
    name:     "Ima",
    location: "Ohio",
    bio:      "I'm a awesome programmer",
    password: "111111",
    password_confirmation: "111111",

    })
    u.save!

  puts "Generating fake users \n"
  5.times do |time|
    u = User.new ({
      email:    Faker::Internet.unique.email,
      username: Faker::Superhero.unique.descriptor,
      name:     Faker::FunnyName.two_word_name,
      location: Faker::Address.state,
      bio:      Faker::Lorem.paragraph,
      password: "123456",
      password_confirmation: "123456",

      })
      u.save!
      create_messages(u)
    end
