require "spec"
require "../src/solutions"

input = <<-TXT
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
TXT

describe Solutions202201 do
  describe ".part_1" do
    it { Solutions202201.part_1(input).should eq 24000 }
  end

  describe ".part_2" do
    it { Solutions202201.part_2(input).should eq 45000 }
  end
end
