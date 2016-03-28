module UdaciListErrors

  class InvalidTypeError < StandardError
  end

  class IndexExceedsListSize < StandardError
  end

  class InvalidPriorityValue < StandardError
  end

  # Error classes go here
end
