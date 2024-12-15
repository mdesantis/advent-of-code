require "spec"
require "../src/solutions"

describe Solutions202202 do
  input = File.read File.join(__DIR__, "../../../../../inputs/2022/02/test_input")

  describe ".part_1" do
    it { Solutions202202.part_1(input).should eq 15 }
  end

  describe ".part_2" do
    it { Solutions202202.part_2(input).should eq 12 }
  end
end
