# frozen_string_literal: true

require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/08/input')

puts "[2022/08/1] #{Solutions202208.part_1 INPUT}"
puts "[2022/08/2] #{Solutions202208.part_2 INPUT}"
