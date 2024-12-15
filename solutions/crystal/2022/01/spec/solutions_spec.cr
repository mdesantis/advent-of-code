require "spec"
require "../src/solutions"

describe Solutions202201 do
  input = File.read File.join(__DIR__, "../../../../../inputs/2022/01/test_input")

  describe ".part_1" do
    it { Solutions202201.part_1(input).should eq 24000 }
  end

  describe ".part_2" do
    it { Solutions202201.part_2(input).should eq 45000 }
  end
end
