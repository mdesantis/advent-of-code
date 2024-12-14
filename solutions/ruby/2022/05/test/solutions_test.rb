# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202205 < Minitest::Test
  INPUT = <<-TXT
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
  TXT

  def test_part_1
    assert_equal 'CMZ', Solutions202205.part_1(INPUT)
  end

  def test_part_2
    assert_equal 'MCD', Solutions202205.part_2(INPUT)
  end
end
