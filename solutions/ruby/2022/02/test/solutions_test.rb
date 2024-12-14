# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202202 < Minitest::Test
  INPUT = 'A Y
B X
C Z
'

  def test_part_1
    assert_equal 15, Solutions202202.part_1(INPUT)
  end

  def test_part_2
    assert_equal 12, Solutions202202.part_2(INPUT)
  end
end
