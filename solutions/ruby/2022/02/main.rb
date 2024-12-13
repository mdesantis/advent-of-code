# frozen_string_literal: true

require 'bundler/setup'
require_relative 'lib/rock_paper_scissors/part_1'
require_relative 'lib/rock_paper_scissors/part_2'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/02/input')

result = RockPaperScissors::Game.new(INPUT.split("\n").map do |input_line|
  RockPaperScissors::Part1::Round.from_input_line(input_line)
end).score
puts "[2022/02/1] #{result}"

result = RockPaperScissors::Game.new(INPUT.split("\n").map do |input_line|
  RockPaperScissors::Part2::Round.from_input_line(input_line)
end).score
puts "[2022/02/2] #{result}"
