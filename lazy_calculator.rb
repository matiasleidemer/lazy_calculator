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

  def calc
    return 0 if @numbers.size == 0

    result = 0

    calc_structure.each do |number, operation|
      result = result.send operation, number
    end

    result
  end

  private

  def build_new_instance
    self.class.new numbers: @numbers, operations: @operations
  end

  def calc_structure
    Hash[@numbers.zip @operations]
  end
end
