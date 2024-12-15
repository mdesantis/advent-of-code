require "../rock_paper_scissors"

module Solutions202202
  module RockPaperScissors
    module Part2
      record Opponent, shape : Shape do
        SHAPES_BY_INPUT = {"A" => Shape::Rock, "B" => Shape::Paper, "C" => Shape::Scissors}

        def self.from_shape_input(shape_input : String)
          new SHAPES_BY_INPUT[shape_input]
        end
      end

      record Player, expected_outcome : Outcome do
        EXPECTED_OUTCOMES_BY_INPUT = {"X" => Outcome::Loose, "Y" => Outcome::Draw, "Z" => Outcome::Win}

        def self.from_expected_outcome_input(expected_outcome_input : String)
          new EXPECTED_OUTCOMES_BY_INPUT[expected_outcome_input]
        end
      end

      class Round < Round
        GUESSED_PLAYER_SHAPES = {
          [Shape::Rock, Outcome::Win]     => Shape::Paper,
          [Shape::Paper, Outcome::Win]    => Shape::Scissors,
          [Shape::Scissors, Outcome::Win] => Shape::Rock,

          [Shape::Rock, Outcome::Draw]     => Shape::Rock,
          [Shape::Paper, Outcome::Draw]    => Shape::Paper,
          [Shape::Scissors, Outcome::Draw] => Shape::Scissors,

          [Shape::Rock, Outcome::Loose]     => Shape::Scissors,
          [Shape::Paper, Outcome::Loose]    => Shape::Rock,
          [Shape::Scissors, Outcome::Loose] => Shape::Paper,
        }

        def self.from_input_line(input_line)
          opponent_shape_input, expected_outcome_input = input_line.split(' ')

          new Opponent.from_shape_input(opponent_shape_input), Player.from_expected_outcome_input(expected_outcome_input)
        end

        getter guessed_player_shape : Shape

        def initialize(@opponent : Opponent, @player : Player)
          @guessed_player_shape = guess_player_shape
        end

        def guess_player_shape
          GUESSED_PLAYER_SHAPES[[opponent.shape, player.expected_outcome]]
        end

        def shape_score
          SHAPE_SCORES[guessed_player_shape]
        end

        def outcome
          return Outcome::Draw if opponent.shape == guessed_player_shape

          OUTCOMES[[opponent.shape, guessed_player_shape]]
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
