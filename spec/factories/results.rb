FactoryBot.define do
  factory :result do
    question { Faker::Quote.famous_last_words }
    answer { Faker::Quote.famous_last_words }
  end
end
