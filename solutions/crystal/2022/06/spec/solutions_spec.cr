require "spec"
require "../src/solutions"

input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

describe Solutions202206 do
  describe ".part_1" do
    it { Solutions202206.part_1(input).should eq 7 }
  end

  describe ".part_2" do
    it { Solutions202206.part_2(input).should eq 19 }
  end
end
