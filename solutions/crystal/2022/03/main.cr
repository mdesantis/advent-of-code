require "./src/solutions"

INPUT = File.read File.join(__DIR__, "../../../../inputs/2022/03/input")

puts "[2022/03/1] #{Solutions202203.part_1 INPUT}"
puts "[2022/03/2] #{Solutions202203.part_2 INPUT}"
