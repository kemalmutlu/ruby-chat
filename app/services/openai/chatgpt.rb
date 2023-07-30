module Openai
  class Chatgpt
    MESSAGE_PREFIX = 'You are a Ruby on Rails developer, '

    attr_reader :client

    def initialize
      @client = OpenAI::Client.new
    end

    def chat(message)
      raise 'Message is empty' if message.empty?

      response = call_client(message)

      response.dig('choices', 0, 'message', 'content').presence || 'Couldn\'t retrieve answer, try again!'
    end

    def question(message)
      MESSAGE_PREFIX + message
    end

    private

    def call_client(message)
      client.chat(
        parameters: {
          model: model,
          temperature: temperature,
          max_tokens: max_tokens,
          messages: [
            {
              role: role,
              content: question(message),
            },
          ],
        },
      )
    end

    def model
      @model ||= 'gpt-3.5-turbo'
    end

    def role
      @role ||= 'user'
    end

    def temperature
      @temperature ||= 0.7
    end

    def max_tokens
      @max_tokens ||= 800
    end
  end
end
