require "./src/solutions"

input = File.read File.join(__DIR__, "../../../../inputs/2022/04/input")

puts "[2022/04/1] #{Solutions202204.part_1 input}"
puts "[2022/04/2] #{Solutions202204.part_2 input}"
