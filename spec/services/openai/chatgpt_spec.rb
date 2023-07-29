require 'rails_helper'

RSpec.describe(Openai::Chatgpt, type: :service) do
  let(:url) { 'https://api.openai.com/v1/chat/completions' }
  let(:response_body) do
    File.read(Rails.root.join('spec/fixtures/openai_fixtures/openai_response.json').to_s)
  end

  let(:model) { 'gpt-3.5-turbo' }
  let(:role) { 'user' }
  let(:temperature) { 0.7 }

  let(:openai_chat_params) do
    {
      parameters: {
        model: model,
        temperature: temperature,
        messages: [
          {
            role: role,
            content: message_prefix + message,
          },
        ],
      },
    }
  end

  let(:message_prefix) { described_class::MESSAGE_PREFIX }
  let(:message) { 'this is a messsage to chatgpt' }

  subject { described_class.new }

  before do
    stub_request(:post, url).to_return(status: 200, body: response_body)
  end

  it 'return answer' do
    expect_any_instance_of(Openai::Chatgpt).to(receive(:call_client).with(message).and_call_original)
    expect_any_instance_of(OpenAI::Client).to(receive(:chat).with(openai_chat_params).and_call_original)

    answer = subject.chat(message)

    expect(answer).to(eq(JSON.parse(response_body).dig('choices', 0, 'message', 'content')))
  end
end
