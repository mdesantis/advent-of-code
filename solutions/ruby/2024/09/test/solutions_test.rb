# frozen_string_literal: true

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/file_blocks_compacting'

class TestSolutions202409 < Minitest::Test
  INPUT = '2333133121414131402'

  def test_part_1
    result = FileBlocksCompacting.new(INPUT).filesystem_checksum_after_file_blocks_compacting

    assert_equal 1928, result
  end

  def test_part_2
    result = FileBlocksCompactingDealingWithFileSystemFragmentation
      .new(INPUT)
      .filesystem_checksum_after_file_blocks_compacting

    assert_equal 2858, result
  end
end
