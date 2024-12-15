require "./src/solutions"

input = File.read File.join(__DIR__, "../../../../inputs/2022/01/input")

puts "[2022/01/1] #{Solutions202201.part_1 input}"
puts "[2022/01/2] #{Solutions202201.part_2 input}"
