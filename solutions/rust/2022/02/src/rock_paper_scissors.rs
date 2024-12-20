pub mod part_1;
pub mod part_2;

use std::str::FromStr;

#[derive(Debug)]
enum Shape {
    Rock,
    Paper,
    Scissors,
}

#[derive(Debug)]
enum Outcome {
    Win,
    Loose,
    Draw,
}

#[derive(Debug)]
struct Opponent {
    shape: Shape,
}

impl FromStr for Opponent {
    type Err = String;

    fn from_str(shape_input: &str) -> Result<Self, Self::Err> {
        let shape = match shape_input {
            "A" => Shape::Rock,
            "B" => Shape::Paper,
            "C" => Shape::Scissors,
            _ => return Err(format!("{:?} is not a valid shape", shape_input).to_string()),
        };
        Ok(Self { shape })
    }
}

trait Round {
    fn shape_score(&self) -> u32;

    fn outcome(&self) -> Outcome;

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
