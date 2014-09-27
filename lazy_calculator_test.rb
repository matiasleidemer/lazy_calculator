require "minitest/autorun"
require_relative "lazy_calculator"

class TestLazyCalculator < Minitest::Test
  def setup
    @lazy_calculator = LazyCalculator.new
    @complex_calculator = LazyCalculator.new.plus(13).minus(3).minus(5).plus(1)
  end

  def test_lazy_calculator_kind_of
    assert_kind_of LazyCalculator, @lazy_calculator
  end

  def test_attributes_initialization
    assert_equal [], @lazy_calculator.numbers
    assert_equal [], @lazy_calculator.operations
  end

  def test_plus_method_returns_a_new_instance_with_attributes
    output = @lazy_calculator.plus 2

    assert_kind_of LazyCalculator, output
    assert_equal [2], output.numbers
    assert_equal [:+], output.operations
  end

  def test_minus_method_returns_a_new_instance_with_attributes
    output = @lazy_calculator.minus 15

    assert_kind_of LazyCalculator, output
    assert_equal [15], output.numbers
    assert_equal [:-], output.operations
  end

  def test_minus_and_plus_methods_works_together
    assert_equal [13, 3, 5, 1], @complex_calculator.numbers
    assert_equal [:+, :-, :-, :+], @complex_calculator.operations
  end

  def test_calc
    assert_equal 6, @complex_calculator.calc
  end
end
