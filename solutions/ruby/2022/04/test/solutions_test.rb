# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202204 < Minitest::Test
  INPUT = <<-TXT
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
  TXT

  def test_part_1
    assert_equal 2, Solutions202204.part_1(INPUT)
  end

  def test_part_2
    assert_equal 4, Solutions202204.part_2(INPUT)
  end
end
