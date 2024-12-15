require "./device_file_system"

module Solutions202207
  def self.part_1(input)
    DeviceFileSystem.new(input.split("\n")).directory_sizes_less_than_100_000_sum
  end

  def self.part_2(input)
    DeviceFileSystem.new(input.split("\n")).candidate_directories_for_deletion_sizes.min
  end
end
