require "spec"
require "../src/solutions"

describe Solutions202204 do
  input = File.read File.join(__DIR__, "../../../../../inputs/2022/04/test_input")

  describe ".part_1" do
    it { Solutions202204.part_1(input).should eq 2 }
  end

  describe ".part_2" do
    it { Solutions202204.part_2(input).should eq 4 }
  end
end
