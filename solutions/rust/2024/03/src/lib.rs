use regex::Regex;

pub fn part_1(input: &str) -> i32 {
    multiplications_sum(input)
}

pub fn part_2(input: &str) -> i32 {
    enabled_multiplications_sum(input)
}

fn multiplications_sum(input_contents: &str) -> i32 {
    let regex = Regex::new(r"mul\(([0-9]{1,3}),([0-9]{1,3})\)").unwrap();

    regex
        .captures_iter(input_contents)
        .map(|captures| {
            let (_, [first, second]) = captures.extract();

            first.parse::<i32>().unwrap() * second.parse::<i32>().unwrap()
        })
        .sum::<i32>()
}

fn enabled_multiplications_sum(input_contents: &str) -> i32 {
    let regex = Regex::new(
        r"(mul\((?<first>[0-9]{1,3}),(?<second>[0-9]{1,3})\))|(?<disabler>don't)|(?<enabler>do)",
    )
    .unwrap();

    let mut enabled = true;

    regex
        .captures_iter(input_contents)
        .filter_map(|captures| {
            enabled = match (captures.name("disabler"), captures.name("enabler")) {
                (Some(_), _) => false,
                (_, Some(_)) => true,
                _ => enabled,
            };

            if enabled {
                let first = captures.name("first")?.as_str().parse::<i32>().unwrap();
                let second = captures.name("second")?.as_str().parse::<i32>().unwrap();

                return Some(first * second);
            }

            None
        })
        .sum()
}

#[cfg(test)]
mod tests {
    use super::*;

    const INPUT: &str = include_str!("../../../../../inputs/2024/03/test_input");

    #[test]
    fn test_part_1() {
        assert_eq!(part_1(INPUT), 161);
    }

    #[test]
    fn test_part_2() {
        assert_eq!(part_2(INPUT), 48);
    }
}
