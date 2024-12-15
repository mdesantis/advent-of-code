Code.require_file("../lib/solutions.exs", __DIR__)

defmodule Solutions202201Test do
  use ExUnit.Case

  @input ~S"""
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
  """

  test ".part_1" do
    assert Solutions202201.part_1(@input) == 24000
  end

  test ".part_2" do
    assert Solutions202201.part_2(@input) == 45000
  end
end
