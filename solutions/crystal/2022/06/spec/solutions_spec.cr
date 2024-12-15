require "spec"
require "../src/solutions"

describe Solutions202206 do
  input = File.read File.join(__DIR__, "../../../../../inputs/2022/06/test_input")

  describe ".part_1" do
    it { Solutions202206.part_1(input).should eq 7 }
  end

  describe ".part_2" do
    it { Solutions202206.part_2(input).should eq 19 }
  end
end
