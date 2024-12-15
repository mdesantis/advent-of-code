module Solutions202201
  def self.part_1(input)
    input.chomp.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&.to_i) }.max
  end

  def self.part_2(input)
    input.chomp.split("\n\n").map { |calories_list| calories_list.split("\n").sum(&.to_i) }.sort[-3, 3].sum
  end
end
