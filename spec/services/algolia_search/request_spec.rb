require 'rails_helper'

RSpec.describe(AlgoliaSearch::Request, type: :service) do
  let(:result) { create(:result) }
  let(:result_2) { create(:result) }
  let(:result_3) { create(:result) }

  let(:message) { 'very creative messsage' }

  let(:raw_search_result) do
    {
      hits: [
        { id: result.id },
        { id: result_2.id },
      ],
    }.deep_stringify_keys
  end

  subject { described_class.new(message) }

  before do
    allow(Result).to(receive(:raw_search).with(message).and_return(raw_search_result))
    allow(Result).to(receive(:reindex!).and_return(nil))
  end

  it 'return already existing result from algolia' do
    results = subject.fetch_data

    expect(results.count).to(eq(2))
    expect(results[0].id).to(eq(result.id))
    expect(results[1].id).to(eq(result_2.id))
  end

  it 'increment counts' do
    expect do
      subject.fetch_data
    end.to(change { result.reload.count }.from(1).to(2)
        .and(change { result_2.reload.count }.from(1).to(2)))

    expect(result_3.count).to(eq(1))
  end

  it 'message is empty' do
    message = ''

    expect do
      described_class.new(message).fetch_data
    end.to(raise_error(RuntimeError, 'Message is empty'))
  end
end
