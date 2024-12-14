# frozen_string_literal: true

require_relative '../monkey_in_the_middle'

module Solutions202211
  module MonkeyInTheMiddle
    module Part2
      class Game < Game
        def initialize(monkeys)
          super

          @monkeys_divisors_least_common_multiple = compute_monkeys_divisors_least_common_multiple
        end

        def compute_monkeys_divisors_least_common_multiple
          first_divisor, *other_divisors = @monkeys.map { |monkey| monkey.divider.divisor }

          other_divisors.reduce(first_divisor, &:lcm)
        end

        def new_worry_level(monkey, worry_level)
          monkey.inspect_item worry_level % @monkeys_divisors_least_common_multiple
        end
      end
    end
  end
end
