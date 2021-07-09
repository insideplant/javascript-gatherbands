FactoryBot.define do
  # Userモデルのテストデータを定義
  factory :user do
    user_name { Faker::Lorem.characters(number:10) }
    last_name { Faker::Lorem.characters(number:10) }
    first_name { Faker::Lorem.characters(number:10) }
    last_name_kana { "カタカナ" }
    first_name_kana { "カタカナ" }
    postal_code { Faker::Lorem.characters(number:10) }
    address { Faker::Lorem.characters(number:10) }
    telephone_number { Faker::Lorem.characters(number:10) }
    profile_image_id { [ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.jpg'), 'app/assets/images/test.jpg') ] }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { 'test_password' }
    password_confirmation { 'test_password' }
    
    trait :with_nested_instances do
      after( :create ) do |band|
        create :band, id: band.id
      end
    end
  end
end
