# frozen_string_literal: true

module Solutions202204
  def self.part_1(input)
    input.split("\n").count do |pairs|
      pair_1_range, pair_2_range = pairs.split(',').map { |pair| Range.new(*pair.split('-').map(&:to_i)) }

      pair_1_range.cover?(pair_2_range) || pair_2_range.cover?(pair_1_range)
    end
  end

  def self.part_2(input)
    input.split("\n").count do |pairs|
      pair_1_range, pair_2_range = pairs.split(',').map { |pair| Range.new(*pair.split('-').map(&:to_i)) }

      pair_1_range.cover?(pair_2_range.first) || pair_2_range.cover?(pair_1_range.first)
    end
  end
end
