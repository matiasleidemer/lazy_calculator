class LazyCalculator
  attr_reader :numbers, :operations

  def initialize(opts={})
    @numbers = opts.fetch :numbers, []
    @operations = opts.fetch :operations, []
  end

  def plus(value)
  end

  def minus(value)
  end

  def times(value)
  end

  def division(value)
  end
end
