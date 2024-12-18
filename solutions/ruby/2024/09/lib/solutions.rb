# frozen_string_literal: true

require_relative '../lib/file_system_compacting'

module Solutions202409
  def self.part_1(input)
    FileSystemCompacting.file_system_checksum_after_compacting(input)
  end

  def self.part_2(input)
    FileSystemCompactingDealingWithFilesFragmentation.file_system_checksum_after_compacting(input)
  end
end
