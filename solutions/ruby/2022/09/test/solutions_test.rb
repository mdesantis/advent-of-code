# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202209 < Minitest::Test
  INPUT_PART_1 = File.read File.join(__dir__, '../../../../../inputs/2022/09/test_input_part_1')
  INPUT_PART_2 = File.read File.join(__dir__, '../../../../../inputs/2022/09/test_input_part_2')

  def test_part_1
    assert_equal 13, Solutions202209.part_1(INPUT_PART_1)
  end

  def test_part_2
    assert_equal 36, Solutions202209.part_2(INPUT_PART_2)
  end
end
