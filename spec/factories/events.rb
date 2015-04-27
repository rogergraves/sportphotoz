FactoryGirl.define do
  factory :event do
    name { Faker::Lorem.word }
    path '/a/b/c'
    description { Faker::Lorem.sentence }
  end
end