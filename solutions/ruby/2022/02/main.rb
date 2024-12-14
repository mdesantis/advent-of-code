# frozen_string_literal: true

require 'bundler/setup'
require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/02/input')

puts "[2022/02/1] #{part_1 INPUT}"
puts "[2022/02/2] #{part_2 INPUT}"
