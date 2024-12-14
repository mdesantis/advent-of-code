# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'

class TestSolutions202202 < Minitest::Test
  INPUT = '1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
'

  def test_part_1
    assert_equal 24000, part_1(INPUT)
  end

  def test_part_2
    assert_equal 45000, part_2(INPUT)
  end
end
