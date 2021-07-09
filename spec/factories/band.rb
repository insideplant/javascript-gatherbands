FactoryBot.define do
  # Bandモデルのテストデータを定義
  factory :band do
    band_name { Faker::Lorem.characters(number:10) }
    band_image_id { [ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.jpg'), 'app/assets/images/test.jpg') ] }
  end
end