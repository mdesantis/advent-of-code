# frozen_string_literal: true

require_relative '../rock_paper_scissors'

module Solutions202202
  module RockPaperScissors
    module Part2
      class Opponent
        SHAPES_BY_INPUT = { 'A' => Shape::ROCK, 'B' => Shape::PAPER, 'C' => Shape::SCISSORS }.freeze

        attr_reader :shape

        def self.from_shape_input(shape_input)
          new SHAPES_BY_INPUT[shape_input]
        end

        def initialize(shape)
          @shape = shape
        end
      end

      class Player
        EXPECTED_OUTCOMES_BY_INPUT = { 'X' => Outcome::LOOSE, 'Y' => Outcome::DRAW, 'Z' => Outcome::WIN }.freeze

        attr_reader :expected_outcome

        def self.from_expected_outcome_input(expected_outcome_input)
          new EXPECTED_OUTCOMES_BY_INPUT[expected_outcome_input]
        end

        def initialize(expected_outcome)
          @expected_outcome = expected_outcome
        end
      end

      class Round < Round
        GUESSED_PLAYER_SHAPES = {
          [Shape::ROCK, Outcome::WIN] => Shape::PAPER,
          [Shape::PAPER, Outcome::WIN] => Shape::SCISSORS,
          [Shape::SCISSORS, Outcome::WIN] => Shape::ROCK,

          [Shape::ROCK, Outcome::DRAW] => Shape::ROCK,
          [Shape::PAPER, Outcome::DRAW] => Shape::PAPER,
          [Shape::SCISSORS, Outcome::DRAW] => Shape::SCISSORS,

          [Shape::ROCK, Outcome::LOOSE] => Shape::SCISSORS,
          [Shape::PAPER, Outcome::LOOSE] => Shape::ROCK,
          [Shape::SCISSORS, Outcome::LOOSE] => Shape::PAPER
        }.freeze

        attr_reader :guessed_player_shape

        def self.from_input_line(input_line)
          opponent_shape_input, expected_outcome_input = input_line.split
          new Opponent.from_shape_input(opponent_shape_input),
              Player.from_expected_outcome_input(expected_outcome_input)
        end

        def initialize(opponent, player)
          super
          @guessed_player_shape = guess_player_shape
        end

        def guess_player_shape
          GUESSED_PLAYER_SHAPES[[opponent.shape, player.expected_outcome]]
        end

        def shape_score
          SHAPE_SCORES[guessed_player_shape]
        end

        def outcome
          return Outcome::DRAW if opponent.shape == guessed_player_shape

          OUTCOMES[[opponent.shape, guessed_player_shape]]
        end
      end

      class Game < Game
        def self.round_class
          Round
        end
      end
    end
  end
end
