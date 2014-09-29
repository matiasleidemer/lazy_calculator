class LazyCalculator
  attr_reader :numbers, :operations

  def initialize(opts={})
    @numbers = opts.fetch :numbers, []
    @operations = opts.fetch :operations, []
  end

  def plus(value)
    @numbers << value
    @operations << :+

    self
  end

  def minus(value)
    @numbers << value
    @operations << :-

    self
  end

  def calc
    calc_structure.inject(0) do |result, (number, operation)|
      result.send operation, number
    end
  end

  private

  def calc_structure
    Hash[@numbers.zip @operations]
  end
end
