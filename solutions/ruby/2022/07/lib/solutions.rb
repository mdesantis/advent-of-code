# frozen_string_literal: true

require_relative 'device_file_system'

module Solutions202207
  def part_1(input)
    DeviceFileSystem.new(input.split("\n")).dir_sizes_lt_100_000_sum
  end

  def part_2(input)
    DeviceFileSystem.new(input.split("\n")).candidate_dirs_for_deletion_sizes.min
  end

  module_function :part_1, :part_2
end
