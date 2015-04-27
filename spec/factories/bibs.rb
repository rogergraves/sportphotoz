FactoryGirl.define do
  factory :bib do
    number { SecureRandom.random_number(100000) }
  end
end