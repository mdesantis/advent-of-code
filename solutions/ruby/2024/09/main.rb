# frozen_string_literal: true

require 'bundler/setup'
require_relative 'lib/file_blocks_compacting'

INPUT = File.read File.join(__dir__, '../../../../inputs/2024/09/input')

result = FileBlocksCompacting.new(INPUT).filesystem_checksum_after_file_blocks_compacting
puts "[2024/09/1] #{result}"

result = FileBlocksCompactingDealingWithFileSystemFragmentation
  .new(INPUT)
  .filesystem_checksum_after_file_blocks_compacting
puts "[2024/09/2] #{result}"
