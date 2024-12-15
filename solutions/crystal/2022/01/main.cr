require "./src/solutions"

INPUT = File.read File.join(__DIR__, "../../../../inputs/2022/01/input")

puts "[2022/01/1] #{Solutions202201.part_1 INPUT}"
puts "[2022/01/2] #{Solutions202201.part_2 INPUT}"
