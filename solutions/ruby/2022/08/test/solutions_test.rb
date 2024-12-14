# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202208 < Minitest::Test
  INPUT = <<-TXT
30373
25512
65332
33549
35390
  TXT

  def test_part_1
    assert_equal 21, Solutions202208.part_1(INPUT)
  end

  def test_part_2
    assert_equal 8, Solutions202208.part_2(INPUT)
  end
end
