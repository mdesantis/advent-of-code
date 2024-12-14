# frozen_string_literal: true

require_relative '../monkey_in_the_middle'

module Solutions202211
  module MonkeyInTheMiddle
    module Part1
      class Game < Game
        def new_worry_level(monkey, worry_level)
          monkey.inspect_item(worry_level) / 3
        end
      end
    end
  end
end
