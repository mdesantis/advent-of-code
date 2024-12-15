require "./src/solutions"

input = File.read File.join(__DIR__, "../../../../inputs/2022/02/input")

puts "[2022/02/1] #{Solutions202202.part_1 input}"
puts "[2022/02/2] #{Solutions202202.part_2 input}"
