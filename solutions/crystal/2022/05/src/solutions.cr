module Solutions202205
  INPUT = File.read File.join(__DIR__, "../../../../../inputs/2022/05/input")

  def self.part_1(input)
    stacks_drawing_plus_legend, rearrangement_procedure = input.chomp.split("\n\n").map { |v| v.split("\n") }
    stacks_drawing = stacks_drawing_plus_legend[0..-2]
    untrasposed_stacks = stacks_drawing.map do |line|
      Array.new(((line.size // 4) + 1)) do |i|
        line[i * 4, 3].scan(/\[([A-Z])\]/).map { |match_data| match_data[0][1] }[0]?
      end
    end.reverse

    stacks_amount = untrasposed_stacks.max_of(&.size)
    stacks_max_size = untrasposed_stacks.size

    # Variable-sized-elements transpose flavour, as `Array#transpose` supports only same-sized elements
    stacks = Array.new(stacks_amount) do |i|
      Array.new(stacks_max_size) { |ii| untrasposed_stacks[ii][i]? }.compact
    end

    rearrangement_procedure.each do |rearrangement_procedure_line|
      rearrangement_procedure_line.scan(/move ([0-9]+) from ([0-9]+) to ([0-9]+)/) do |match_data|
        amount, from, to = match_data.captures.map(&.try(&.to_i))

        stacks[to - 1].concat stacks[from - 1].pop(amount).reverse if amount && from && to
      end
    end

    stacks.map(&.last).join
  end

  def self.part_2(input)
    stacks_drawing_plus_legend, rearrangement_procedure = input.chomp.split("\n\n").map { |v| v.split("\n") }
    stacks_drawing = stacks_drawing_plus_legend[0..-2]
    untrasposed_stacks = stacks_drawing.map do |line|
      Array.new(((line.size // 4) + 1)) do |i|
        line[i * 4, 3].scan(/\[([A-Z])\]/).map { |match_data| match_data[0][1] }[0]?
      end
    end.reverse

    stacks_amount = untrasposed_stacks.max_of(&.size)
    stacks_max_size = untrasposed_stacks.size

    # Variable-sized-elements transpose flavour, as `Array#transpose` supports only same-sized elements
    stacks = Array.new(stacks_amount) do |i|
      Array.new(stacks_max_size) { |ii| untrasposed_stacks[ii][i]? }.compact
    end

    rearrangement_procedure.each do |rearrangement_procedure_line|
      rearrangement_procedure_line.scan(/move ([0-9]+) from ([0-9]+) to ([0-9]+)/) do |match_data|
        amount, from, to = match_data.captures.map(&.try(&.to_i))

        stacks[to - 1].concat stacks[from - 1].pop(amount) if amount && from && to
      end
    end

    stacks.map(&.last).join
  end
end
