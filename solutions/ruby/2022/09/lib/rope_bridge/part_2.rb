# frozen_string_literal: true

require_relative '../rope_bridge'

module Solutions202209
  module RopeBridge
    module Part2
      class Grid < Grid
        def initialize
          super

          @positions = Array.new(10) { Position.new(0, 0) }

          @head_position = @positions.first
          @tail_position = @positions.last
          @tail_positions = @positions[1..]
        end

        def process_move_step(direction)
          update_head_position direction
          update_tail_positions
        end

        def update_tail_positions
          @tail_positions.each_with_index { |position, i| position.move_towards @positions[i] }

          @positions_visited_by_tail << @tail_position.to_a
        end
      end
    end
  end
end
