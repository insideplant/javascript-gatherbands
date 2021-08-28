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


  4.times do |n|
    name = Faker::Name.name
    band_name = Faker::Name.name
    a = User.create!(
      user_name: name,
      email: "example#{n + 1}@example.com",
      profile_image: File.open("./app/assets/images/user#{n + 1}.jpg"),
      password: "example",
      password_confirmation: "example",
    )

    Band.create!(band_name: band_name,
             user_id: a.id
             )
  end

  # Articles
  users = User.where(admin: false)
  5.times do
    article = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.band.articles.create!(content: article) }
  end

  # Live_houses
  LiveHouse.create!(
    [
      {
        house_name: "HOUSE1",
        email: "housele@house1.com",
        price: "200000",
        postal_code: "1111111",
        address: "大阪府茨木市",
        website: "https://www.google.com/?hl=ja",
        telephone_number: "11111111111",
        image: File.open("./app/assets/images/studio1.jpeg"),
        password: "house1",
        password_confirmation: "house1",
      },
      {
        house_name: "HOUSE2",
        email: "house2@house2.com",
        price: "300000",
        postal_code: "2222222",
        address: "広島県安芸津市",
        website: "https://www.google.com/?hl=ja",
        telephone_number: "22222222222",
        image: File.open("./app/assets/images/studio2.jpeg"),
        password: "house2",
        password_confirmation: "house2",
      },
      {
        house_name: "HOUSE3",
        email: "house3@house3.com",
        price: "400000",
        postal_code: "3333333",
        address: "東京都港区",
        website: "https://www.google.com/?hl=ja",
        telephone_number: "33333333333",
        image: File.open("./app/assets/images/studio3.jpeg"),
        password: "house3",
        password_confirmation: "house3",
      }
    ]
  )

  Live.create!(
    [
      {
        live_name: "解散ライブ",
        introduction: "解散ライブです、最後に是非ともご参加ください！",
        amount: "3",
        start_at: "2022-03-02 00:00:00",
        end_at: "2022-03-02 00:00:00",
        live_house_id: "1",
        live_image: File.open("./app/assets/images/live_image1.jpeg"),
        status: "gathering",
        registered_person: true,
      },
      {
        live_name: "結成ライブ",
        introduction: "初ライブです、是非ともご参加ください！",
        amount: "3",
        start_at: "2022-03-02 00:00:00",
        end_at: "2022-03-02 00:00:00",
        live_house_id: "2",
        live_image: File.open("./app/assets/images/live_image2.jpg"),
        status: "waiting_live",
        registered_person: true,
      },
      {
        live_name: "クリスマスライブ",
        introduction: "メリークリスマス！",
        amount: "3",
        start_at: "2022-12-24 00:00:00",
        end_at: "2022-12-24 00:00:00",
        live_house_id: "3",
        live_image: File.open("./app/assets/images/live_image3.jpg"),
        status: "finish_live",
        registered_person: true,
      },
      {
        live_name: "20th anniversary live",
        introduction: "20周年記念ライブ",
        amount: "3",
        start_at: "2022-01-24 00:00:00",
        end_at: "2022-01-24 00:00:00",
        live_house_id: "2",
        live_image: File.open("./app/assets/images/live_image4.jpg"),
        status: "waiting_live",
        registered_person: true,
      },
      {
        live_name: "大阪ライブ",
        introduction: "大阪でライブします",
        amount: "3",
        start_at: "2022-02-24 00:00:00",
        end_at: "2022-02-24 00:00:00",
        live_house_id: "3",
        live_image: File.open("./app/assets/images/live_image5.jpg"),
        status: "waiting_live",
        registered_person: true,
      },
      {
        live_name: "basist live",
        introduction: "ベーシストのみ参加可能なライブです。",
        amount: "3",
        start_at: "2022-11-24 00:00:00",
        end_at: "2022-11-24 00:00:00",
        live_house_id: "2",
        live_image: File.open("./app/assets/images/live_image6.jpg"),
        status: "waiting_live",
        registered_person: true,
      }
    ]
  )

   LiveOrganization.create!(
     [
      {
        band_id: 2,
        live_id: 1,
        host: true,
      },
      {
        band_id: 3,
        live_id: 2,
        host: true,
      },
      {
        band_id: 2,
        live_id: 2,
        host: false,
      },
      {
        band_id: 4,
        live_id: 2,
        host: false,
      },
      {
        band_id: 5,
        live_id: 2,
        host: false,
      },
      {
        band_id: 3,
        live_id: 3,
        host: true,
      },
      {
        band_id: 2,
        live_id: 3,
        host: false,
      },
      {
        band_id: 4,
        live_id: 3,
        host: false,
      },
      {
        band_id: 3,
        live_id: 4,
        host: true,
      },
      {
        band_id: 2,
        live_id: 4,
        host: false,
      },
      {
        band_id: 4,
        live_id: 4,
        host: false,
      },
      {
        band_id: 5,
        live_id: 4,
        host: false,
      },
      {
        band_id: 3,
        live_id: 5,
        host: true,
      },
      {
        band_id: 2,
        live_id: 5,
        host: false,
      },
      {
        band_id: 4,
        live_id: 5,
        host: false,
      },
      {
        band_id: 5,
        live_id: 5,
        host: false,
      },
      {
        band_id: 3,
        live_id: 6,
        host: true,
      },
      {
        band_id: 2,
        live_id: 6,
        host: false,
      },
      {
        band_id: 4,
        live_id: 6,
        host: false,
      },
      {
        band_id: 5,
        live_id: 6,
        host: false,
      },
    ]
  )