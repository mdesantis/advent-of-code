# frozen_string_literal: true

require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/09/input')

puts "[2022/09/1] #{Solutions202209.part_1 INPUT}"
puts "[2022/09/2] #{Solutions202209.part_2 INPUT}"
