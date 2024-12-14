# frozen_string_literal: true

require_relative '../rock_paper_scissors'

module RockPaperScissors
  module Part1
    class PlayerOrOpponent
      attr_reader :shape

      def self.from_shape_input(shape_input)
        new shapes_by_input[shape_input]
      end

      def initialize(shape)
        @shape = shape
      end
    end

    class Opponent < PlayerOrOpponent
      SHAPES_BY_INPUT = { 'A' => Shape::ROCK, 'B' => Shape::PAPER, 'C' => Shape::SCISSORS }.freeze

      def self.shapes_by_input
        SHAPES_BY_INPUT
      end
    end

    class Player < PlayerOrOpponent
      SHAPES_BY_INPUT = { 'X' => Shape::ROCK, 'Y' => Shape::PAPER, 'Z' => Shape::SCISSORS }.freeze

      def self.shapes_by_input
        SHAPES_BY_INPUT
      end
    end

    class Round < Round
      def self.from_input_line(input_line)
        opponent_shape_input, player_shape_input = input_line.split
        new Opponent.from_shape_input(opponent_shape_input), Player.from_shape_input(player_shape_input)
      end

      def shape_score
        SHAPE_SCORES[player.shape]
      end

      def outcome
        return Outcome::DRAW if opponent.shape == player.shape

        OUTCOMES[[opponent.shape, player.shape]]
      end
    end

    class Game < Game
      def self.round_class
        Round
      end
    end
  end
end
