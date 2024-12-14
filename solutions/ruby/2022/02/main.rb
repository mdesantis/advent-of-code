# frozen_string_literal: true

require 'bundler/setup'
require_relative 'lib/rock_paper_scissors/part_1'
require_relative 'lib/rock_paper_scissors/part_2'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/02/input')

result = RockPaperScissors::Part1::Game.from_input(INPUT).score
puts "[2022/02/1] #{result}"

result = RockPaperScissors::Part2::Game.from_input(INPUT).score
puts "[2022/02/2] #{result}"
