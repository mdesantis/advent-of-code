# frozen_string_literal: true

require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/03/input')

puts "[2022/03/1] #{Solutions202203.part_1 INPUT}"
puts "[2022/03/2] #{Solutions202203.part_2 INPUT}"
