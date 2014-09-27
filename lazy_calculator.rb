class LazyCalculator
  attr_reader :numbers, :operations

  def initialize(opts={})
    @numbers = opts.fetch :numbers, []
    @operations = opts.fetch :operations, []
  end

  def plus(value)
    @numbers << value
    @operations << :+

    self.class.new numbers: @numbers, operations: @operations
  end

  def minus(value)
  end

  def times(value)
  end

  def division(value)
  end
end
