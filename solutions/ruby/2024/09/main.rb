# frozen_string_literal: true

require 'bundler/setup'
require_relative 'lib/solutions'

INPUT = File.read File.join(__dir__, '../../../../inputs/2024/09/input')

puts "[2024/09/1] #{part_1 INPUT}"
puts "[2024/09/2] #{part_2 INPUT}"
