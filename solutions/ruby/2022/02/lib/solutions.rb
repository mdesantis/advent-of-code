# frozen_string_literal: true

require_relative 'rock_paper_scissors/part_1'
require_relative 'rock_paper_scissors/part_2'

def part_1(input)
  RockPaperScissors::Part1::Game.from_input(input).score
end

def part_2(input)
  RockPaperScissors::Part2::Game.from_input(input).score
end
