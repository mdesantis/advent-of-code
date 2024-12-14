# frozen_string_literal: true

require_relative '../rope_bridge'

module Solutions202209
  module RopeBridge
    module Part1
      class Grid < Grid
        def initialize
          super

          @head_position = Position.new(0, 0)
          @tail_position = Position.new(0, 0)
        end

        def process_move_step(direction)
          update_head_position direction
          update_tail_position
        end

        def update_tail_position
          @tail_position.move_towards @head_position

          @positions_visited_by_tail << @tail_position.to_a
        end
      end
    end
  end
end
