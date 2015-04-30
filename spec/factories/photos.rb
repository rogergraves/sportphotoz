FactoryGirl.define do
  factory :photo do
    aws_key { "#{Faker::Internet.slug}.jpg" }
    marathon
    participant
  end
end