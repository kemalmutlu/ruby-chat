require 'rails_helper'

RSpec.describe(Ask, type: :service) do
  let(:result) { create(:result) }
  let(:result_2) { create(:result) }

  let(:message) { 'very creative messsage' }
  let(:chatgpt_answer) { 'ai stuff' }

  subject { described_class.new(message) }

  it 'return already existing result from algolia' do
    result
    result_2

    expect(AlgoliaSearch::Request).to(
      receive_message_chain(:new, :fetch_data).with(message).with(no_args).and_return([result, result_2]),
    )

    expect_any_instance_of(described_class).not_to(receive(:create_result_from_chatgpt))

    service_result = subject.fetch_result

    expect(service_result.id).to(eq(result.id))
  end

  it 'ask chatgpt and create result' do
    expect(AlgoliaSearch::Request).to(receive_message_chain(:new, :fetch_data).with(message).with(no_args).and_return([]))
    expect_any_instance_of(described_class).to(receive(:create_result_from_chatgpt).and_call_original)
    expect(OpenAI::Client).to(receive(:new).and_return(nil))
    expect_any_instance_of(Openai::Chatgpt).to(receive(:chat).with(message).and_return(chatgpt_answer))

    expect do
      subject.fetch_result
    end.to(change { Result.count }.by(1))

    new_result = Result.first

    expect(new_result.question).to(eq(Openai::Chatgpt::MESSAGE_PREFIX + message))
    expect(new_result.answer).to(eq(chatgpt_answer))
  end

  it 'message is empty' do
    message = ''

    expect do
      described_class.new(message).fetch_result
    end.to(raise_error(RuntimeError, 'Message is empty'))
  end
end
