# frozen_string_literal: true

module Solutions202201
  def part_1(input)
    input.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&:to_i) }.max
  end

  def part_2(input)
    input.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&:to_i) }.max(3).sum
  end

  module_function :part_1, :part_2
end
