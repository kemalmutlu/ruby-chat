class CustomError < StandardError
  def initialize(message = "An error occurred.")
    super(message)
  end
end
