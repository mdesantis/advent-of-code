use std::str::FromStr;

use super::{Opponent, Outcome, Shape};

#[derive(Debug)]
struct Player {
    shape: Shape,
}

#[derive(Debug)]
struct Round {
    opponent: Opponent,
    player: Player,
}

#[derive(Debug)]
pub struct Game {
    rounds: Vec<Round>,
}

impl FromStr for Player {
    type Err = String;

    fn from_str(shape_input: &str) -> Result<Self, Self::Err> {
        let shape = match shape_input {
            "X" => Shape::Rock,
            "Y" => Shape::Paper,
            "Z" => Shape::Scissors,
            _ => return Err(format!("{:?} is not a valid shape", shape_input).to_string()),
        };
        Ok(Player { shape })
    }
}

impl FromStr for Round {
    type Err = String;

    fn from_str(round_input: &str) -> Result<Self, Self::Err> {
        let mut slices = round_input.split(' ');

        let opponent = slices.next().map(Opponent::from_str);
        let player = slices.next().map(Player::from_str);

        if let (Some(Ok(opponent)), Some(Ok(player)), None) = (opponent, player, slices.next()) {
            Ok(Round { opponent, player })
        } else {
            Err(format!("{:?} is not a valid round", round_input).to_string())
        }
    }
}

impl FromStr for Game {
    type Err = String;

    fn from_str(input: &str) -> Result<Self, Self::Err> {
        let maybe_rounds = input
            .trim_end()
            .split("\n")
            .map(|input_line| Round::from_str(input_line))
            .collect::<Result<Vec<_>, _>>();

        if let Ok(rounds) = maybe_rounds {
            Ok(Game { rounds })
        } else {
            Err(format!("{:?} are not valid rounds", maybe_rounds).to_string())
        }
    }
}

impl Round {
    fn shape_score(&self) -> u32 {
        match &self.player.shape {
            Shape::Rock => 1,
            Shape::Paper => 2,
            Shape::Scissors => 3,
        }
    }

    fn outcome(&self) -> Outcome {
        match (&self.opponent.shape, &self.player.shape) {
            (Shape::Scissors, Shape::Rock) => Outcome::Win,
            (Shape::Paper, Shape::Scissors) => Outcome::Win,
            (Shape::Rock, Shape::Paper) => Outcome::Win,
            (Shape::Rock, Shape::Scissors) => Outcome::Loose,
            (Shape::Scissors, Shape::Paper) => Outcome::Loose,
            (Shape::Paper, Shape::Rock) => Outcome::Loose,
            _ => Outcome::Draw,
        }
    }

    fn outcome_score(&self) -> u32 {
        match &self.outcome() {
            Outcome::Win => 6,
            Outcome::Draw => 3,
            Outcome::Loose => 0,
        }
    }

    fn score(&self) -> u32 {
        &self.shape_score() + &self.outcome_score()
    }
}

impl Game {
    pub fn score(&self) -> u32 {
        self.rounds.iter().map(|round| round.score()).sum()
    }
}
