use std::str::FromStr;

use super::{Opponent, Outcome, Shape};

#[derive(Debug)]
struct Player {
    shape: Shape,
}

#[derive(Debug)]
pub struct Round {
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
        Ok(Self { shape })
    }
}

impl FromStr for Round {
    type Err = String;

    fn from_str(round_input: &str) -> Result<Self, Self::Err> {
        let mut slices = round_input.split(' ');

        let opponent = slices.next().map(str::parse::<Opponent>);
        let player = slices.next().map(str::parse::<Player>);

        if let (Some(Ok(opponent)), Some(Ok(player)), None) = (opponent, player, slices.next()) {
            Ok(Self { opponent, player })
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
            .map(str::parse::<Round>)
            .collect::<Result<Vec<_>, _>>();

        if let Ok(rounds) = maybe_rounds {
            Ok(Self { rounds })
        } else {
            Err(format!("{:?} are not valid rounds", maybe_rounds).to_string())
        }
    }
}

impl super::Round for Round {
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
}

impl super::Game for Game {
    type RoundType = Round;

    fn rounds(&self) -> &[Round] {
        &self.rounds
    }
}
