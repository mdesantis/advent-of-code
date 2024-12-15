# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202210 < Minitest::Test
  INPUT = File.read File.join(__dir__, '../../../../../inputs/2022/10/test_input')

  def test_part_1
    assert_equal 13140, Solutions202210.part_1(INPUT)
  end

  def test_part_2
    assert_equal <<-TXT, Solutions202210.part_2(INPUT)
##..##..##..##..##..##..##..##..##..##..
###...###...###...###...###...###...###.
####....####....####....####....####....
#####.....#####.....#####.....#####.....
######......######......######......####
#######.......#######.......#######.....
    TXT
  end
end
