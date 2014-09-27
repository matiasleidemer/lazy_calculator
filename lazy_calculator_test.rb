require "minitest/autorun"
require_relative "lazy_calculator"

class TestLazyCalculator < Minitest::Test
  def setup
    @lazy_calculator = LazyCalculator.new
  end

  def test_lazy_calculator_kind_of
    assert_kind_of LazyCalculator, @lazy_calculator
  end

  def test_attributes_initialization
    assert_equal [], @lazy_calculator.numbers
    assert_equal [], @lazy_calculator.operations
  end
end
