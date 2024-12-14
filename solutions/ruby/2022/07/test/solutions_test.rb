# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solutions'

class TestSolutions202207 < Minitest::Test
  INPUT = <<-TXT
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k

  TXT

  def test_part_1
    assert_equal 95437, Solutions202207.part_1(INPUT)
  end

  def test_part_2
    assert_equal 24933642, Solutions202207.part_2(INPUT)
  end
end
