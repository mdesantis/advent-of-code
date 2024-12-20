mod rock_paper_scissors;

use rock_paper_scissors::Game;

pub fn part_1(input: &str) -> u32 {
    let game = input.parse::<rock_paper_scissors::part_1::Game>().unwrap();

    game.score()
}

pub fn part_2(input: &str) -> u32 {
    let game = input.parse::<rock_paper_scissors::part_2::Game>().unwrap();

    game.score()
}

#[cfg(test)]
mod tests {
    use super::*;

    const INPUT: &str = include_str!("../../../../../inputs/2022/02/test_input");

    #[test]
    fn test_part_1() {
        assert_eq!(part_1(INPUT), 15);
    }

    #[test]
    fn test_part_2() {
        assert_eq!(part_2(INPUT), 12);
    }
}
