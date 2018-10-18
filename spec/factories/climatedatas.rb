FactoryBot.define do
  factory :climatedata do
    max_temp { Faker::Number.decimal(2, 1) }
    min_temp { Faker::Number.decimal(2, 1) }
    mean_temp { Faker::Number.decimal(2, 1) }
    total_rainfall { Faker::Number.decimal(2, 1) }
    total_sunshine { Faker::Number.decimal(2, 1) }
    month { Faker::Number.between(1, 12) }
    year { Faker::Number.between(1, 10000) }
    weatherstation_id { nil }
  end
end
