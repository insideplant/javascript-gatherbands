FactoryBot.define do
  # LiveHouseモデルのテストデータを定義
  factory :live_house do
    house_name { Faker::Lorem.characters(number: 10) }
    price { rand(10000..100000) }
    postal_code { '1234567' }
    address { Faker::Lorem.characters(number: 10) }
    website { Faker::Lorem.characters(number: 10) }
    detail { Faker::Lorem.characters(number: 10) }
    telephone_number { '12345678910' }
    email { "example@example.com" }
    password { 'test_password' }
    password_confirmation { 'test_password' }
  end
end