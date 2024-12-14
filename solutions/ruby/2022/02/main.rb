# frozen_string_literal: true

require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/02/input')

puts "[2022/02/2] #{Solutions202202.part_2 INPUT}"
puts "[2022/02/1] #{Solutions202202.part_1 INPUT}"
