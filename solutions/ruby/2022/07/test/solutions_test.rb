# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202207 < Minitest::Test
  INPUT = File.read File.join(__dir__, '../../../../../inputs/2022/07/test_input')

  def test_part_1
    assert_equal 95437, Solutions202207.part_1(INPUT)
  end

  def test_part_2
    assert_equal 24933642, Solutions202207.part_2(INPUT)
  end
end
