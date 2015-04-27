FactoryGirl.define do
  factory :photo do
    url { Faker::Internet.url }
    event
    bib
  end
end