require "spec"
require "../src/solutions"

input = <<-TXT
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2

TXT

describe Solutions202205 do
  describe ".part_1" do
    it { Solutions202205.part_1(input).should eq "CMZ" }
  end

  describe ".part_2" do
    it { Solutions202205.part_2(input).should eq "MCD" }
  end
end
