require 'minitest/autorun'
require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_solution
    # 問題文中の例題1
    assert_equal 5, solution('abcda0d12', 'a*d', 0)
    # 問題文中の例題2
    assert_equal 19, solution('ab1cdab9cde', 'a.*d', 15)
    # 文字列要件にマッチするものが1つもないケース
    assert_equal -1, solution('ab1cdab9cde', 'r*z', 0)
    # 文字列要件にマッチするものはあったが、強度要件を満たすものがないケース
    assert_equal -1, solution('abcddd', 'b*d', 18)
    # 適当に作ったケース(最小強度の探索をしているか確認用)
    assert_equal 25, solution('aaa55551111', 'a*1', 25)
  end
  def test_patternToRegex
    assert_equal /a.+b/, patternToRegex('a*b')
    assert_equal /a..+b/, patternToRegex('a.*b')
  end
  def test_calculateStrength
    assert_equal 10, calculateStrength('1234')
    assert_equal 10, calculateStrength('abcd')
    assert_equal 6, calculateStrength('a2c')
  end
end