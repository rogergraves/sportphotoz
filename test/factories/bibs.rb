FactoryGirl.define do
  factory :bib do
    number { Faker::Bib.number}
    photo_id { Faker::Bib.photo_id}
  end

end
