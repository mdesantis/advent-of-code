# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/solutions'

class TestSolutions202409 < Minitest::Test
  INPUT = '2333133121414131402'

  def test_part_1
    assert_equal 1928, ::Solutions202409.part_1(INPUT)
  end

  def test_part_2
    assert_equal 2858, ::Solutions202409.part_2(INPUT)
  end
end
