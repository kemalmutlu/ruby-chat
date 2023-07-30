class Ask
  attr_reader :message

  def initialize(message)
    raise 'Message is empty' if message.empty?

    @message = message
  end

  def fetch_result
    result = AlgoliaSearch::Request.new(message).fetch_data.first

    result.presence || create_result_from_chatgpt
  end

  private

  def create_result_from_chatgpt
    service = Openai::Chatgpt.new
    answer = service.chat(message)

    Result.create!(question: service.question(message), answer: answer)
  end
end
