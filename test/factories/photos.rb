FactoryGirl.define do
  factory :photo do
    url { Faker::Photo.url}
    event_id { Faker::Photo.event_id}
    bib_id { Faker::Photo.bib_id}
  end

end
