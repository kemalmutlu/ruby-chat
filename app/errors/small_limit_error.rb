class SmallLimitError < CustomError
  def initialize
    message = "Message has to be more then 10 characters."
    super(message)
  end
end
