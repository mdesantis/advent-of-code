require "./src/solutions"

input = File.read File.join(__DIR__, "../../../../inputs/2022/07/input")

puts "[2022/07/1] #{Solutions202207.part_1 input}"
puts "[2022/07/2] #{Solutions202207.part_2 input}"
