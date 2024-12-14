# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202206 < Minitest::Test
  INPUT = 'mjqjpqmgbljsphdztnvjfqwrcgsmlb'

  def test_part_1
    assert_equal 7, Solutions202206.part_1(INPUT)
  end

  def test_part_2
    assert_equal 19, Solutions202206.part_2(INPUT)
  end
end