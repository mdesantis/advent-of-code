require "./src/solutions"

input = File.read File.join(__DIR__, "../../../../inputs/2022/05/input")

puts "[2022/05/1] #{Solutions202205.part_1 input}"
puts "[2022/05/2] #{Solutions202205.part_2 input}"
