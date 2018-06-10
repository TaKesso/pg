require 'minitest/autorun'
require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_solution
    # 問題文中の例題
    assert_equal 9, solution(5, 5, [
        %w(s . . x .),
        %w(. x . . .),
        %w(. o x o x),
        %w(. x . . .),
        %w(. . . x g),
    ])
    # ゴールできないケース
    assert_equal 0, solution(5, 5, [
        %w(s . . x .),
        %w(. x . . .),
        %w(. o x o x),
        %w(. x . x x),
        %w(. . . x g),
    ])
    # サイズを広げたケース(無駄な計算を省略できてるか確認用)
    assert_equal 9, solution(10, 10, [
        %w(s . . x . . x . o .),
        %w(. x . . . . o x o x),
        %w(. o x o x . o . . .),
        %w(. x . . . . . . x .),
        %w(. . . x g . x . o .),
        %w(o x . . . . o x o x),
        %w(o o x o x . o . . .),
        %w(. x . . . . . . x .),
        %w(. x . . . . o x o x),
        %w(x . . x . . x . o .),
    ])
    # 適当に作ってみたケース
    assert_equal 18, solution(10, 10, [
        %w(. . . . . . . . . .),
        %w(. x . . . . o x o .),
        %w(. o s o x . o . . .),
        %w(. x . . . . . . x .),
        %w(. . . x . . x . o .),
        %w(o x . . . . o x o .),
        %w(o o x x x x x . . .),
        %w(. x . . . . x . x .),
        %w(. x . x . g . o o .),
        %w(. . . x . . . . . .),
    ])
  end
end