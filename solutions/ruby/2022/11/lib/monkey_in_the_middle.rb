# frozen_string_literal: true

module Solutions202211
  module MonkeyInTheMiddle
    class Monkey
      class Operation
        def self.from_input(input)
          input.scan(/(old|[0-9]+) (\*|\+) (old|[0-9]+)/) do |operand_1, operation, operand_2|
            return new(
              operand_1 == 'old' ? operand_1.to_sym : operand_1.to_i,
              operation.to_sym,
              operand_2 == 'old' ? operand_2.to_sym : operand_2.to_i
            )
          end
        end

        def initialize(operand_1, operation, operand_2)
          @operand_1 = operand_1
          @operation = operation
          @operand_2 = operand_2
        end

        def call(old)
          case @operation
          when :+
            current_operand(@operand_1, old) + current_operand(@operand_2, old)
          when :*
            current_operand(@operand_1, old) * current_operand(@operand_2, old)
          end
        end

        def current_operand(operand, old)
          operand == :old ? old : operand
        end
      end

      class Divider
        def self.from_input(condition_input, if_true_input, if_false_input)
          divisor = condition_input.scan(/[0-9]+/)[0].to_i
          if_true_monkey_index = if_true_input.scan(/[0-9]+/)[0].to_i
          if_false_monkey_index = if_false_input.scan(/[0-9]+/)[0].to_i

          new divisor, if_true_monkey_index, if_false_monkey_index
        end

        attr_reader :divisor

        def initialize(divisor, if_true_monkey_index, if_false_monkey_index)
          @divisor = divisor
          @if_true_monkey_index = if_true_monkey_index
          @if_false_monkey_index = if_false_monkey_index
        end

        def call(worry_level)
          (worry_level % @divisor).zero? ? @if_true_monkey_index : @if_false_monkey_index
        end
      end

      def self.from_input(input)
        lines = input.split("\n")
        starting_worry_levels = lines[1].scan(/[0-9]+/).map(&:to_i)
        operation = Operation.from_input lines[2]
        divider = Divider.from_input(lines[3], lines[4], lines[5])

        new starting_worry_levels, operation, divider
      end

      attr_reader :worry_levels, :divider, :inspected_items_count

      def initialize(starting_worry_levels, operation, divider)
        @worry_levels = starting_worry_levels
        @operation = operation
        @divider = divider
        @inspected_items_count = 0
      end

      def inspect_item(worry_level)
        @inspected_items_count += 1

        @operation.call(worry_level)
      end

      def divider_worry_level(worry_level)
        @divider.call(worry_level)
      end
    end

    class Game
      def self.from_input(input)
        new(input.split("\n\n").map { |v| Monkey.from_input v })
      end

      attr_reader :monkeys

      def initialize(monkeys)
        @monkeys = monkeys
      end

      def play_round
        @monkeys.each do |monkey|
          monkey.worry_levels.size.times do
            worry_level = monkey.worry_levels.shift
            new_worry_level = new_worry_level monkey, worry_level
            monkey_index_to_throw_worry_level = monkey.divider_worry_level new_worry_level

            @monkeys[monkey_index_to_throw_worry_level].worry_levels << new_worry_level
          end
        end
      end

      def monkey_business
        first_two = monkeys.map(&:inspected_items_count).max(2)

        first_two[0] * first_two[1]
      end
    end
  end
end
