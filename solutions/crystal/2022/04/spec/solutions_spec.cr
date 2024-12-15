require "spec"
require "../src/solutions"

input = <<-TXT
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8

TXT

describe Solutions202204 do
  describe ".part_1" do
    it { Solutions202204.part_1(input).should eq 2 }
  end

  describe ".part_2" do
    it { Solutions202204.part_2(input).should eq 4 }
  end
end
