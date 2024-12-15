require "spec"
require "../src/solutions"

describe Solutions202207 do
  input = File.read File.join(__DIR__, "../../../../../inputs/2022/07/test_input")

  describe ".part_1" do
    it { Solutions202207.part_1(input).should eq 95437 }
  end

  describe ".part_2" do
    it { Solutions202207.part_2(input).should eq 24933642 }
  end
end
