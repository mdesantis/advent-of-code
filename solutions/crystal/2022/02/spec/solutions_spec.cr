require "spec"
require "../src/solutions"

input = <<-TXT
A Y
B X
C Z
TXT

describe Solutions202202 do
  describe ".part_1" do
    it { Solutions202202.part_1(input).should eq 15 }
  end

  describe ".part_2" do
    it { Solutions202202.part_2(input).should eq 12 }
  end
end
