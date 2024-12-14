# frozen_string_literal: true

module Solutions202210
  module CathodeRayTube
    class CPU
      NOOP = 'noop'
      ADDX_INSTRUCTION_PREFIX = 'addx '

      include Enumerable

      def initialize(instruction_inputs)
        @x = 1
        @instruction_inputs = instruction_inputs
      end

      def each
        return to_enum unless block_given?

        @instruction_inputs.each do |instruction_input|
          yield @x

          next if instruction_input == NOOP

          yield @x

          @x += instruction_input.delete_prefix(ADDX_INSTRUCTION_PREFIX).to_i
        end

        self
      end
    end

    class Screen
      WIDTH = 40
      HEIGHT = 6
      LIT_PIXEL = '#'
      DARK_PIXEL = '.'
      ROW_TERMINATOR = "\n"
      ROW_TERMINATOR_SIZE = ROW_TERMINATOR.size

      def initialize
        @screen = +''
        @completed_rows = 0
      end

      def to_s
        -@screen.dup
      end

      def update(sprite_horizontal_position, cycle)
        @current_row_index = current_row_index(cycle)

        @screen[screen_index] = current_sprite_pixel(sprite_horizontal_position)

        close_row if end_of_row?
      end

      private

      def current_row_index(cycle)
        modulo = cycle % WIDTH
        (modulo.positive? ? modulo : WIDTH) - 1
      end

      def screen_index
        @current_row_index + (WIDTH * @completed_rows) + (ROW_TERMINATOR_SIZE * @completed_rows)
      end

      def current_sprite_pixel(sprite_horizontal_position)
        if @current_row_index.between?(sprite_horizontal_position - 1, sprite_horizontal_position + 1)
          LIT_PIXEL
        else
          DARK_PIXEL
        end
      end

      def end_of_row?
        @current_row_index == WIDTH - 1
      end

      def close_row
        @screen << ROW_TERMINATOR
        @completed_rows += 1
      end
    end
  end
end
