module Solutions202202
  module RockPaperScissors
    enum Shape
      Rock
      Paper
      Scissors
    end

    enum Outcome
      Win
      Loose
      Draw
    end

    class Round
      SHAPE_SCORES = {
        Shape::Rock     => 1,
        Shape::Paper    => 2,
        Shape::Scissors => 3,
      }

      OUTCOMES = {
        [Shape::Scissors, Shape::Rock]  => Outcome::Win,
        [Shape::Paper, Shape::Scissors] => Outcome::Win,
        [Shape::Rock, Shape::Paper]     => Outcome::Win,
        [Shape::Rock, Shape::Scissors]  => Outcome::Loose,
        [Shape::Scissors, Shape::Paper] => Outcome::Loose,
        [Shape::Paper, Shape::Rock]     => Outcome::Loose,
      }

      OUTCOME_SCORES = {
        Outcome::Win   => 6,
        Outcome::Draw  => 3,
        Outcome::Loose => 0,
      }

      getter :opponent, :player

      def outcome_score
        OUTCOME_SCORES[outcome]
      end

      def score
        shape_score + outcome_score
      end
    end

    class Game
      def self.from_input(input)
        new(input.split("\n", remove_empty: true).map do |input_line|
          round_class.from_input_line(input_line)
        end)
      end

      getter :rounds

      def score
        rounds.sum(&.score)
      end
    end
  end
end
