# frozen_string_literal: true

require_relative '../lib/file_blocks_compacting'

module Solutions202409
  def part_1(input)
    FileBlocksCompacting.new(input).filesystem_checksum_after_file_blocks_compacting
  end

  def part_2(input)
    FileBlocksCompactingDealingWithFileSystemFragmentation
      .new(input)
      .filesystem_checksum_after_file_blocks_compacting
  end

  module_function :part_1, :part_2
end
