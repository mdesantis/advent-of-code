# frozen_string_literal: true

require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2024/09/input')

puts "[2024/09/1] #{Solutions202409.part_1 INPUT}"
puts "[2024/09/2] #{Solutions202409.part_2 INPUT}"
