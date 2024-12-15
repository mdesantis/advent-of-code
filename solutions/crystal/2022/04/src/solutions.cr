module Solutions202204
  INPUT = File.read File.join(__DIR__, "../../../../../inputs/2022/04/input")

  def self.part_1(input)
    input.chomp.split("\n").count do |pairs|
      pair_1_range, pair_2_range = pairs.split(',').map do |pair|
        Range.new(*{Int32, Int32}.from(pair.split('-').map(&.to_i)))
      end

      (pair_1_range.begin >= pair_2_range.begin && pair_1_range.end <= pair_2_range.end) ||
        (pair_2_range.begin >= pair_1_range.begin && pair_2_range.end <= pair_1_range.end)
    end
  end

  def self.part_2(input)
    input.chomp.split("\n").count do |pairs|
      pair_1_range, pair_2_range = pairs.split(',').map do |pair|
        Range.new(*{Int32, Int32}.from(pair.split('-').map(&.to_i)))
      end

      pair_1_range.covers?(pair_2_range.begin) || pair_2_range.covers?(pair_1_range.begin)
    end
  end
end
