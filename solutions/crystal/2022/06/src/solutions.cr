module Solutions202206
  def self.part_1(input)
    amount_of_unique_chars = 4

    (input.size - amount_of_unique_chars).times do |i|
      if input[i..(i + (amount_of_unique_chars - 1))].chars.uniq.size == amount_of_unique_chars
        return i + amount_of_unique_chars
      end
    end
  end

  def self.part_2(input)
    amount_of_unique_chars = 14

    (input.size - amount_of_unique_chars).times do |i|
      if input[i..(i + (amount_of_unique_chars - 1))].chars.uniq.size == amount_of_unique_chars
        return i + amount_of_unique_chars
      end
    end
  end
end
