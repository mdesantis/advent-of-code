# frozen_string_literal: true

require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/10/input')

puts "[2022/10/1] #{Solutions202210.part_1 INPUT}"
puts '[2022/10/2]', Solutions202210.part_2(INPUT)
