# frozen_string_literal: true

require_relative '../lib/file_blocks_compacting'

module Solutions202409
  def self.part_1(input)
    FileBlocksCompacting.new(input).filesystem_checksum_after_file_blocks_compacting
  end

  def self.part_2(input)
    FileBlocksCompactingDealingWithFileSystemFragmentation
      .new(input)
      .filesystem_checksum_after_file_blocks_compacting
  end
end
