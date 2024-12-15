# frozen_string_literal: true

require_relative 'device_file_system'

module Solutions202207
  def self.part_1(input)
    DeviceFileSystem.new(input.split("\n")).dir_sizes_lt_100_000_sum
  end

  def self.part_2(input)
    DeviceFileSystem.new(input.split("\n")).candidate_dirs_for_deletion_sizes.min
  end
end
