# frozen_string_literal: true

module Solutions202202
  module RockPaperScissors
    module Shape
      ROCK = :rock
      PAPER = :paper
      SCISSORS = :scissors
    end

    module Outcome
      WIN = :won
      LOOSE = :lost
      DRAW = :draw
    end

    class Round
      SHAPE_SCORES = {
        Shape::ROCK => 1,
        Shape::PAPER => 2,
        Shape::SCISSORS => 3
      }.freeze

      OUTCOMES = {
        [Shape::SCISSORS, Shape::ROCK] => Outcome::WIN,
        [Shape::PAPER, Shape::SCISSORS] => Outcome::WIN,
        [Shape::ROCK, Shape::PAPER] => Outcome::WIN,
        [Shape::ROCK, Shape::SCISSORS] => Outcome::LOOSE,
        [Shape::SCISSORS, Shape::PAPER] => Outcome::LOOSE,
        [Shape::PAPER, Shape::ROCK] => Outcome::LOOSE
      }.freeze

      OUTCOME_SCORES = {
        Outcome::WIN => 6,
        Outcome::DRAW => 3,
        Outcome::LOOSE => 0
      }.freeze

      attr_reader :opponent, :player

      def initialize(opponent, player)
        @opponent = opponent
        @player = player
      end

      def outcome_score
        OUTCOME_SCORES[outcome]
      end

      def score
        shape_score + outcome_score
      end
    end

    class Game
      def self.from_input(input)
        new(input.split("\n").map { |input_line| round_class.from_input_line(input_line) })
      end

      attr_reader :rounds

      def initialize(rounds)
        @rounds = rounds
      end

      def score
        rounds.sum(&:score)
      end
    end
  end
end
