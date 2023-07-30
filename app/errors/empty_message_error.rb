class EmptyMessageError < CustomError
  def initialize
    super("Message cannot be empty.")
  end
end
