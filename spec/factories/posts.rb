FactoryBot.define do
  factory :post do
    name         { Faker::Lorem.words }
    area_id      { 2 }
    hiking_date  { Faker::Date.backward(days: 14) }
    time         { Faker::Lorem.words }
    route_name   { Faker::Lorem.words }
    route_detail { Faker::Lorem.sentence }
    comment      { Faker::Lorem.sentence }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
