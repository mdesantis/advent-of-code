# frozen_string_literal: true

module Solutions202205
  def self.part_1(input)
    stacks_drawing_plus_legend, rearrangement_procedure = input.split("\n\n").map { |v| v.split("\n") }
    stacks_drawing = stacks_drawing_plus_legend[0..-2]

    untrasposed_stacks = stacks_drawing.map do |line|
      Array.new(((line.size / 4) + 1)) { |column_i| line[column_i * 4, 3].scan(/\[([A-Z])\]/)[0] }
    end.reverse

    stacks_amount = untrasposed_stacks.map(&:size).max
    stacks_max_size = untrasposed_stacks.size

    # Variable-sized-elements transpose flavour, as `Array#transpose` supports only same-sized elements
    stacks = Array.new(stacks_amount) do |column_i|
      Array.new(stacks_max_size) { |row_i| untrasposed_stacks[row_i][column_i] }.compact
    end

    rearrangement_procedure.each do |rearrangement_procedure_line|
      rearrangement_procedure_line.scan(/move ([0-9]+) from ([0-9]+) to ([0-9]+)/) do |amount, from, to|
        amount = amount.to_i
        from = from.to_i
        to = to.to_i

        stacks[to - 1].concat stacks[from - 1].pop(amount).reverse
      end
    end

    stacks.map(&:last).join
  end

  def self.part_2(input)
    stacks_drawing_plus_legend, rearrangement_procedure = input.split("\n\n").map { |v| v.split("\n") }
    stacks_drawing = stacks_drawing_plus_legend[0..-2]

    untrasposed_stacks = stacks_drawing.map do |line|
      Array.new(((line.size / 4) + 1)) { |column_i| line[column_i * 4, 3].scan(/\[([A-Z])\]/)[0] }
    end.reverse

    stacks_amount = untrasposed_stacks.map(&:size).max
    stacks_max_size = untrasposed_stacks.size

    # Variable-sized-elements transpose flavour, as `Array#transpose` supports only same-sized elements
    stacks = Array.new(stacks_amount) do |column_i|
      Array.new(stacks_max_size) { |row_i| untrasposed_stacks[row_i][column_i] }.compact
    end

    rearrangement_procedure.each do |rearrangement_procedure_line|
      rearrangement_procedure_line.scan(/move ([0-9]+) from ([0-9]+) to ([0-9]+)/) do |amount, from, to|
        amount = amount.to_i
        from = from.to_i
        to = to.to_i

        stacks[to - 1].concat stacks[from - 1].pop(amount)
      end
    end

    stacks.map(&:last).join
  end
end
