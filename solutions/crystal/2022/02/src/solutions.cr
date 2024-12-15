require "./rock_paper_scissors/part_1"
require "./rock_paper_scissors/part_2"

module Solutions202202
  def self.part_1(input)
    RockPaperScissors::Part1::Game.from_input(input).score
  end

  def self.part_2(input)
    RockPaperScissors::Part2::Game.from_input(input).score
  end
end
