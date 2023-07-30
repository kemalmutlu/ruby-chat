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
class Result < ApplicationRecord
  include AlgoliaSearch

  validates :answer, :question, presence: true
  validates :count, numericality: { greater_than: 0 }
  algoliasearch disable_indexing: proc { Rails.env.test? }, index_name: ENV['ALGOLIA_INDEX_NAME'], auto_index: true, auto_remove: true do
    attributes :id, :answer, :question, :count
  end

  scope :popular_results, -> { order(count: :desc).limit(10) }

  def display_question
    question.gsub('You are a Ruby on Rails developer, ', '')
  end

  class << self
    def increment_all
      update_all('count = count + 1')
    end
  end
end
