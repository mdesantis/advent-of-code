# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202201 < Minitest::Test
  INPUT = <<-TXT
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
  TXT

  def test_part_1
    assert_equal 24000, Solutions202201.part_1(INPUT)
  end

  def test_part_2
    assert_equal 45000, Solutions202201.part_2(INPUT)
  end
end
