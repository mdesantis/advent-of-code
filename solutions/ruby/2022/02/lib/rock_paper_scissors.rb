# frozen_string_literal: true

module RockPaperScissors
  Game = Data.define(:rounds) do
    def score
      rounds.sum(&:score)
    end
  end

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
    attr_reader :opponent, :player

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
end
