module AlgoliaSearch
  class Request
    def initialize(message)
      raise EmptyMessageError.new if message.nil? || message.strip.empty?
      raise SmallLimitError.new if message.size < 10
      @message = message

      def fetch_data
        results_ids = Result.raw_search(@message&.slice(0, 512)).dig('hits')&.pluck('id') || []
        results = Result.where(id: results_ids)

        results.increment_all
        results.reindex!
        results
      end
    end
  end
end

