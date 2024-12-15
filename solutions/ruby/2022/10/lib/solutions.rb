# frozen_string_literal: true

require_relative 'cathode_ray_tube'

module Solutions202210
  def self.part_1(input)
    cycles_of_interest = [20, 60, 100, 140, 180, 220].freeze
    signal_strengths_of_interest =
      CathodeRayTube::CPU
        .new(input.split("\n"))
        .each
        .with_index(1)
        .reduce(0) { |acc, (x, cycle)| cycles_of_interest.include?(cycle) ? acc + (cycle * x) : acc }

    signal_strengths_of_interest
  end

  def self.part_2(input)
    screen = CathodeRayTube::Screen.new

    CathodeRayTube::CPU.new(input.split("\n")).each.with_index(1) do |sprite_horizontal_position, cycle|
      screen.update(sprite_horizontal_position, cycle)
    end

    screen.to_s
  end
end
