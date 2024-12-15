require "../rock_paper_scissors"

module Solutions202202
  module RockPaperScissors
    module Part1
      record Opponent, shape : Shape do
        SHAPES_BY_INPUT = {"A" => Shape::Rock, "B" => Shape::Paper, "C" => Shape::Scissors}

        def self.from_shape_input(shape_input : String)
          new SHAPES_BY_INPUT[shape_input]
        end
      end

      record Player, shape : Shape do
        SHAPES_BY_INPUT = {"X" => Shape::Rock, "Y" => Shape::Paper, "Z" => Shape::Scissors}

        def self.from_shape_input(shape_input : String)
          new SHAPES_BY_INPUT[shape_input]
        end
      end

      class Round < Round
        def self.from_input_line(input_line)
          opponent_shape_input, player_shape_input = input_line.split(' ')

          new Opponent.from_shape_input(opponent_shape_input), Player.from_shape_input(player_shape_input)
        end

        def initialize(@opponent : Opponent, @player : Player)
        end

        def shape_score
          SHAPE_SCORES[player.shape]
        end

        def outcome
          return Outcome::Draw if opponent.shape == player.shape

          OUTCOMES[[opponent.shape, player.shape]]
        end
      end

      class Game < Game
        def self.round_class
          Round
        end

        def initialize(rounds : Array(Round))
          @rounds = rounds
        end
      end
    end
  end
end
