# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202211 < Minitest::Test
  INPUT = File.read File.join(__dir__, '../../../../../inputs/2022/11/test_input')

  def test_part_1
    assert_equal 10605, Solutions202211.part_1(INPUT)
  end

  def test_part_2
    assert_equal 2713310158, Solutions202211.part_2(INPUT)
  end
end
