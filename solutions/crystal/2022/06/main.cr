require "./src/solutions"

input = File.read File.join(__DIR__, "../../../../inputs/2022/06/input")

puts "[2022/06/1] #{Solutions202206.part_1 input}"
puts "[2022/06/2] #{Solutions202206.part_2 input}"
