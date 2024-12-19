pub fn part_1(input: &str) -> u32 {
    input
        .trim_end()
        .split("\n\n")
        .map(|calories_list| {
            calories_list
                .split("\n")
                .map(|calories| calories.parse::<u32>().unwrap())
                .sum::<u32>()
        })
        .max()
        .unwrap()
}

pub fn part_2(input: &str) -> u32 {
    let mut calories = input
        .trim_end()
        .split("\n\n")
        .map(|food_list| {
            food_list
                .split("\n")
                .map(|calories| calories.parse::<u32>().unwrap())
                .sum::<u32>()
        })
        .collect::<Vec<_>>();

    calories.sort_by(|a, b| b.cmp(a));
    calories.get(0..3).unwrap().iter().sum()
}

#[cfg(test)]
mod tests {
    use super::*;

    const INPUT: &str = include_str!("../../../../../inputs/2022/01/test_input");

    #[test]
    fn test_part_1() {
        assert_eq!(part_1(INPUT), 24000);
    }

    #[test]
    fn test_part_2() {
        assert_eq!(part_2(INPUT), 45000);
    }
}
