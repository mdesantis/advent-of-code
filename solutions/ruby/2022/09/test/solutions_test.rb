# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202209 < Minitest::Test
  INPUT_PART_1 = <<-TXT
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
  TXT
  INPUT_PART_2 = <<-TXT
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
  TXT

  def test_part_1
    assert_equal 13, Solutions202209.part_1(INPUT_PART_1)
  end

  def test_part_2
    assert_equal 36, Solutions202209.part_2(INPUT_PART_2)
  end
end
