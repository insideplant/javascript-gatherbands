# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  user = User.create!(user_name: "Admin User",
                      email: "example@example.com",
                      password: "example",
                      password_confirmation: "example",
                      admin: true)
  Band.create!(band_name: "Admin",
               user_id: user.id
               )


  3.times do |n|
    a = User.create!(
      user_name: "Example User#{n + 1}",
      email: "example#{n + 1}@example.com",
      profile_image: File.open("./app/assets/images/user#{n + 1}.jpg"),
      password: "example",
      password_confirmation: "example",
    )

    Band.create!(band_name: "Example_band#{n + 1}",
             user_id: a.id
             )
  end

  Band.all.each do |band|
    band.articles.create!(
      content: 'Hello!',
    )
  end