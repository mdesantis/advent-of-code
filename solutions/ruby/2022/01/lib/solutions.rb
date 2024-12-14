# frozen_string_literal: true

def part_1(input)
  input.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&:to_i) }.max
end

def part_2(input)
  input.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&:to_i) }.max(3).sum
end
