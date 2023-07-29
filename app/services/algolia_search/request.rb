module AlgoliaSearch
  class Request

    def initialize(message)
      raise "Message parameter is empty" if message.empty?
      @message = message
    end
    
    def get_data
      Result.algolia_search(@message&.slice(0, 512))
    end
  end
end
