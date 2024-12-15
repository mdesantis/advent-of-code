require "./src/solutions"

INPUT = File.read File.join(__DIR__, "../../../../inputs/2022/05/input")

puts "[2022/05/1] #{Solutions202205.part_1 INPUT}"
puts "[2022/05/2] #{Solutions202205.part_2 INPUT}"
