# frozen_string_literal: true

require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/11/input')

puts "[2022/11/1] #{Solutions202211.part_1 INPUT}"
puts "[2022/11/2] #{Solutions202211.part_2 INPUT}"
