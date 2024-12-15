require "spec"
require "../src/solutions"

input = <<-TXT
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
TXT

describe Solutions202203 do
  describe ".part_1" do
    it { Solutions202203.part_1(input).should eq 157 }
  end

  describe ".part_2" do
    it { Solutions202203.part_2(input).should eq 70 }
  end
end
