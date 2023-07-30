# == Schema Information
#
# Table name: results
#
#  id         :uuid             not null, primary key
#  answer     :text             not null
#  count      :integer          default(1), not null
#  question   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_results_on_question_and_answer  (question,answer)
#
FactoryBot.define do
  factory :result do
    question { Faker::Quote.famous_last_words }
    answer { Faker::Quote.famous_last_words }
  end
end
