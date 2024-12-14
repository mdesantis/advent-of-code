# frozen_string_literal: true

require 'bundler/setup'
require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/01/input')

puts "[2022/01/1] #{Solutions202201.part_1 INPUT}"
puts "[2022/01/2] #{Solutions202201.part_2 INPUT}"
