# frozen_string_literal: true

module Solutions202206
  def part_1(input)
    amount_of_unique_chars = 4

    (input.size - amount_of_unique_chars).times do |column_i|
      if input[column_i..(column_i + (amount_of_unique_chars - 1))].chars.uniq.size == amount_of_unique_chars
        return column_i + amount_of_unique_chars
      end
    end
  end

  def part_2(input)
    amount_of_unique_chars = 14

    (input.size - amount_of_unique_chars).times do |column_i|
      if input[column_i..(column_i + (amount_of_unique_chars - 1))].chars.uniq.size == amount_of_unique_chars
        return column_i + amount_of_unique_chars
      end
    end
  end

  module_function :part_1, :part_2
end
