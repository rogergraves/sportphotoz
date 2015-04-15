FactoryGirl.define do
  factory :event do
    path { Faker::Event.number}
    description { Faker::Event.description}
    photo_id { Faker::Event.photo_id}
  end

end
