FactoryGirl.define do
  factory :participant do
    bib { SecureRandom.random_number(10000) }
    place { SecureRandom.random_number(10000) }
    gun_time { Kernel::rand(10800000..36000000) } # Range from 5 to 10 hours in Milliseconds
    chip_time { gun_time }
    # runner
    marathon
  end
end