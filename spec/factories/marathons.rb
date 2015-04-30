FactoryGirl.define do
  factory :marathon do
    name { Faker::Lorem.sentence }
    slug { Faker::Internet.slug }
    event_date { Faker::Date.between(5.days.ago, Date.today) }
    aws_prefix { Faker::Internet.slug }
    active true
  end
end