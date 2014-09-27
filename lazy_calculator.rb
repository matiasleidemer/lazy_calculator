class LazyCalculator
  attr_reader :numbers, :operations

  def initialize(opts={})
    @numbers = opts.fetch :numbers, []
    @operations = opts.fetch :operations, []
  end

  def plus(value)
    @numbers << value
    @operations << :+

    build_new_instance
  end

  def minus(value)
    @numbers << value
    @operations << :-

    build_new_instance
  end

  def times(value)
  end

  def division(value)
  end

  private

  def build_new_instance
    self.class.new numbers: @numbers, operations: @operations
  end
end
