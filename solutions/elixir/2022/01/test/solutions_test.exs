Code.require_file("../lib/solutions.exs", __DIR__)

defmodule Solutions202201Test do
  use ExUnit.Case

  @input File.read!(Path.join([__DIR__, "../../../../../inputs/2022/01/test_input"]))

  test ".part_1" do
    assert Solutions202201.part_1(@input) == 24000
  end

  test ".part_2" do
    assert Solutions202201.part_2(@input) == 45000
  end
end
