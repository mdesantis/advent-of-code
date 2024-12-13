# frozen_string_literal: true

require 'bundler/setup'

INPUT = File.read File.join(__dir__, '../../../../inputs/2022/01/input')

solution = INPUT.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&:to_i) }.max
puts "[2022/01/1] #{solution}"

solution = INPUT.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&:to_i) }.max(3).sum
puts "[2022/01/2] #{solution}"
