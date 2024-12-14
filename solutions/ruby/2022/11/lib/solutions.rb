# frozen_string_literal: true

require_relative 'monkey_in_the_middle/part_1'
require_relative 'monkey_in_the_middle/part_2'

module Solutions202211
  def part_1(input)
    game = MonkeyInTheMiddle::Part1::Game.from_input(input)

    20.times { game.play_round }
    game.monkey_business
  end

  def part_2(input)
    game = MonkeyInTheMiddle::Part2::Game.from_input(input)

    10_000.times { game.play_round }
    game.monkey_business
  end

  module_function :part_1, :part_2
end
