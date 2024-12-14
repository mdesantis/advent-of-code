# frozen_string_literal: true

module Solutions202209
  module RopeBridge
    module Direction
      RIGHT = :right
      UP = :up
      LEFT = :left
      DOWN = :down
    end

    Position = Struct.new(:column, :row) do
      def touch?(other_position)
        other_position.column.between?(column - 1, column + 1) &&
          other_position.row.between?(row - 1, row + 1)
      end

      def move_towards(other_position)
        return if touch?(other_position)

        self.column += (other_position.column <=> column)
        self.row += (other_position.row <=> row)
      end
    end

    class Grid
      DIRECTIONS_BY_DIRECTION_INPUT = {
        'R' => Direction::RIGHT,
        'U' => Direction::UP,
        'L' => Direction::LEFT,
        'D' => Direction::DOWN
      }.freeze

      attr_reader :positions_visited_by_tail

      def initialize
        @positions_visited_by_tail = Set.new
      end

      def process_move_input(move_input)
        direction_input, steps_input = move_input.split
        direction = DIRECTIONS_BY_DIRECTION_INPUT[direction_input]
        steps = steps_input.to_i

        process_move direction, steps
      end

      def process_move(direction, steps)
        steps.times { process_move_step direction }
      end

      def update_head_position(direction)
        case direction
        when Direction::RIGHT
          @head_position.row += 1
        when Direction::UP
          @head_position.column -= 1
        when Direction::LEFT
          @head_position.row -= 1
        when Direction::DOWN
          @head_position.column += 1
        end
      end
    end
  end
end
