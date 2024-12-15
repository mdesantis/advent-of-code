require "spec"
require "../src/solutions"

describe Solutions202205 do
  input = File.read File.join(__DIR__, "../../../../../inputs/2022/05/test_input")

  describe ".part_1" do
    it { Solutions202205.part_1(input).should eq "CMZ" }
  end

  describe ".part_2" do
    it { Solutions202205.part_2(input).should eq "MCD" }
  end
end
