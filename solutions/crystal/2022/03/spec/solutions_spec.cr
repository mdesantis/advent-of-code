require "spec"
require "../src/solutions"

describe Solutions202203 do
  input = File.read File.join(__DIR__, "../../../../../inputs/2022/03/test_input")

  describe ".part_1" do
    it { Solutions202203.part_1(input).should eq 157 }
  end

  describe ".part_2" do
    it { Solutions202203.part_2(input).should eq 70 }
  end
end
