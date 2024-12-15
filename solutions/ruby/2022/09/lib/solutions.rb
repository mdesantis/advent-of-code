# frozen_string_literal: true

require_relative 'rope_bridge/part_1'
require_relative 'rope_bridge/part_2'

module Solutions202209
  def self.part_1(input)
    grid = RopeBridge::Part1::Grid.new

    input.split("\n").each do |move_input|
      grid.process_move_input move_input
    end

    grid.positions_visited_by_tail.size
  end

  def self.part_2(input)
    grid = RopeBridge::Part2::Grid.new

    input.split("\n").each do |move_input|
      grid.process_move_input move_input
    end

    grid.positions_visited_by_tail.size
  end
end
