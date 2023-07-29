# == Schema Information
#
# Table name: results
#
#  id         :bigint           not null, primary key
#  answer     :text             not null
#  question   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_results_on_question_and_answer  (question,answer)
#
require "test_helper"

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
