defmodule Solutions202201 do
  def part_1(input) do
    input
    |> String.trim_trailing()
    |> String.split("\n\n")
    |> Enum.map(fn calories_list ->
      calories_list |> String.split("\n") |> Enum.map(&String.to_integer/1) |> Enum.sum()
    end)
    |> Enum.max()
  end

  def part_2(input) do
    input
    |> String.trim_trailing()
    |> String.split("\n\n")
    |> Enum.map(fn calories_list ->
      calories_list |> String.split("\n") |> Enum.map(&String.to_integer/1) |> Enum.sum()
    end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end
end
