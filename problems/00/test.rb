require 'minitest/autorun'
require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_solution
    assert_equal '1', solution(1)
    assert_equal '2', solution(2)
    assert_equal 'Fizz', solution(3)
    assert_equal '4', solution(4)
    assert_equal 'Buzz', solution(5)
    assert_equal 'Fizz', solution(6)
    assert_equal '7', solution(7)
    assert_equal '8', solution(8)
    assert_equal 'Fizz', solution(9)
    assert_equal 'Buzz', solution(10)
    assert_equal '11', solution(11)
    assert_equal 'Fizz', solution(12)
    assert_equal '13', solution(13)
    assert_equal '14', solution(14)
    assert_equal 'FizzBuzz', solution(15)
    assert_equal '16', solution(16)
  end
end