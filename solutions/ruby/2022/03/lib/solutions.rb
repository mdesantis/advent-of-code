# frozen_string_literal: true

module Solutions202203
  def self.part_1(input)
    priorities = (('a'..'z').to_a + ('A'..'Z').to_a).each.with_index(1).to_h

    input.split("\n").sum do |rucksack_input|
      slice_size = rucksack_input.size / 2

      compartment_1 = rucksack_input[0, slice_size]
      compartment_2 = rucksack_input[-slice_size, slice_size]

      (compartment_1.chars & compartment_2.chars).sum { |item_type| priorities[item_type] }
    end
  end

  def self.part_2(input)
    priorities = (('a'..'z').to_a + ('A'..'Z').to_a).each.with_index(1).to_h

    input.split("\n").each_slice(3).sum do |ruckstacks_input|
      ruckstacks_input.map(&:chars).reduce { |acc, v| acc & v }.sum { |item_type| priorities[item_type] }
    end
  end
end
