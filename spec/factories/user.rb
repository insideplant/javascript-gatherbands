FactoryBot.define do
  factory :user do
    user_name { Faker::Lorem.characters(number:10) }
    last_name { Faker::Lorem.characters(number:10) }
    first_name { Faker::Lorem.characters(number:10) }
    last_name_kana { Faker::Lorem.characters(number:10) }
    first_name_kana { Faker::Lorem.characters(number:10) }
    postal_code { Faker::Lorem.characters(number:10) }
    address { Faker::Lorem.characters(number:10) }
    telephone_number { Faker::Lorem.characters(number:10) }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { 'test_password' }
    password_confirmation { 'test_password' }
  end

  factory :article do
    content { Faker::Lorem.characters(number:10) }
  end

  factory :live do
    live_name { Faker::Lorem.characters(number:10)}
    introduction { Faker::Lorem.characters(number:30)}
  end
end
