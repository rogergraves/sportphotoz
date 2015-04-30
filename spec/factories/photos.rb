FactoryGirl.define do
  factory :photo do
    aws_key { Faker::Internet.url }
    marathon
    participant
  end
end