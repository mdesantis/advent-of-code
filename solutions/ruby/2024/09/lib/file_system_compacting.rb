# frozen_string_literal: true

module FileSystemCompacting
  FileBlock = Data.define(:file_id) do
    def same_file_id?(other)
      file_id == other.file_id
    end
  end
  FreeSpace = Data.define

  module_function

  def file_system_checksum_after_compacting(input)
    blocks = blocks(input)
    blocks = compact_file_system(blocks)

    blocks.each_with_index.select { |(v, _)| v.is_a? FileBlock }.sum { |(v, i)| i * v.file_id }
  end

  def blocks(input)
    input
      .chomp
      .each_char
      .each_slice(2)
      .with_index
      .with_object([]) do |((file_blocks_amount, free_space_amount), i), blocks|
      file_blocks_amount = file_blocks_amount.to_i
      free_space_amount = free_space_amount&.to_i

      file_blocks_amount.times { blocks << FileBlock[file_id: i] }
      free_space_amount&.times { blocks << FreeSpace[] }
    end
  end

  def compact_file_system(blocks)
    blocks.each_with_index do |block, i|
      last_file_block = nil

      next if !block.is_a?(FreeSpace) || !(last_file_block = pop_until_file_block(blocks))

      blocks[i] = last_file_block
    end

    blocks
  end

  def pop_until_file_block(blocks)
    while (block = blocks.pop)
      return block if block.is_a?(FileBlock)
    end

    nil
  end
end

module FileSystemCompactingDealingWithFilesFragmentation
  BlockChunk = Data.define :size, :file_id
  FileSystem = Data.define :files, :free_space
  File = Data.define :id, :size, :start_index

  module_function

  def block_chunks(input)
    input
      .chomp
      .each_char
      .each_slice(2)
      .with_index
      .with_object([]) do |((file_blocks_amount, free_space_amount), i), chunks|
      file_blocks_amount = file_blocks_amount.to_i
      free_space_amount = free_space_amount&.to_i

      chunks << BlockChunk[size: file_blocks_amount, file_id: i] if file_blocks_amount.positive?
      chunks << BlockChunk[size: free_space_amount, file_id: nil] if free_space_amount&.positive?
    end
  end

  def file_system(block_chunks)
    file_system = FileSystem[files: [], free_space: {}]

    block_chunks.reduce(0) do |acc, chunk|
      if chunk.file_id
        file_system.files << File[id: chunk.file_id, size: chunk.size, start_index: acc]
      else
        (file_system.free_space[chunk.size - 1] ||= []) << acc
      end

      acc + chunk.size
    end

    file_system.files.sort_by! { |chunk| -chunk.id }

    file_system
  end

  def file_system_checksum_after_compacting(input)
    block_chunks = block_chunks input
    file_system = file_system block_chunks
    compacted_file_system = compacted_file_system file_system

    sum = 0

    compacted_file_system.each_with_index do |file_id, i|
      next unless file_id

      sum += file_id * i
    end

    sum
  end

  def compacted_file_system(file_system)
    compacted_files = compacted_files file_system

    compacted_files.each_with_object([]) do |file, data|
      (file.start_index...(file.start_index + file.size)).each { |i| data[i] = file.id }
    end
  end

  def compacted_files(file_system)
    file_system.files.each_with_object([]) do |file, compacted_files|
      best_start_index, free_space_size = best_start_index file, file_system

      compacted_files << File[id: file.id, size: file.size, start_index: best_start_index]

      next unless best_start_index < file.start_index

      update_free_space file, file_system, best_start_index, free_space_size
    end.sort_by!(&:start_index)
  end

  def best_start_index(file, file_system)
    best_start_index_candidate = file.start_index
    best_free_space_size_candidate = nil

    ((file.size - 1)..file_system.free_space.size).each do |free_space_size|
      next unless file_system.free_space[free_space_size]&.size&.positive?

      start_index_candidate = file_system.free_space[free_space_size].first

      next if start_index_candidate > best_start_index_candidate

      best_start_index_candidate = start_index_candidate
      best_free_space_size_candidate = free_space_size
    end

    [best_start_index_candidate, best_free_space_size_candidate]
  end

  def update_free_space(file, file_system, free_space_start_index, free_space_start_index_size)
    file_system.free_space[free_space_start_index_size].shift

    new_free_space_start_index_size = free_space_start_index_size + 1
    new_free_space_size = new_free_space_start_index_size - file.size

    return unless new_free_space_size.positive?

    (file_system.free_space[new_free_space_size - 1] ||= []) << (free_space_start_index + file.size)
    file_system.free_space[new_free_space_size - 1].sort!
  end
end
