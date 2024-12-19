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
        Ok(Opponent { shape })
    }
}
