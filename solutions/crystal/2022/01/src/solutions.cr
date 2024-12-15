module Solutions202201
  INPUT = File.read File.join(__DIR__, "../../../../../inputs/2022/01/input")

  def self.part_1(input)
    input.chomp.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&.to_i) }.max
  end

  def self.part_2(input)
    input.chomp.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&.to_i) }.sort[-3, 3].sum
  end
end
