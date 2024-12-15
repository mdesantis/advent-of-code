Code.require_file("lib/solutions.exs", __DIR__)

input = File.read!(Path.join([__DIR__, "../../../../inputs/2022/01/input"]))

IO.puts(~s"[2022/01/1] #{Solutions202201.part_1(input)}")
IO.puts(~s"[2022/01/2] #{Solutions202201.part_2(input)}")
