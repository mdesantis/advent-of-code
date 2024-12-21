#![feature(test)]

extern crate test;

use regex::Regex;

pub fn part_1(input: &str) -> i32 {
    words_amount(input)
}

pub fn part_2(input: &str) -> i32 {
    crosses_amount(input)
}

enum SlantDirection {
    Clockwise,
    AntiClockwise,
}

fn rotate_clockwise(input: &str) -> String {
    let lines = input.lines().collect::<Vec<_>>();
    let rows = lines.len();
    let cols = lines[0].len();
    let chars = lines
        .iter()
        .map(|line| line.chars().collect::<Vec<_>>())
        .collect::<Vec<_>>();
    let mut result = String::with_capacity((cols * rows) + cols);

    for i in 0..cols {
        for j in (0..rows).rev() {
            let char = chars[j][i];

            result.push(char);

            if j == 0 {
                result.push('\n');
            }
        }
    }

    result
}

fn slant(input: &str, direction: SlantDirection) -> String {
    let rows = input.lines().count();

    input
        .lines()
        .enumerate()
        .map(|(i, slice)| {
            let (prefix, suffix) = match direction {
                SlantDirection::Clockwise => (" ".repeat(i), " ".repeat(rows - i - 1)),
                SlantDirection::AntiClockwise => (" ".repeat(rows - i - 1), " ".repeat(i)),
            };

            format!("{prefix}{slice}{suffix}")
        })
        .collect::<Vec<_>>()
        .join("\n")
}

fn slant_clockwise(input: &str) -> String {
    slant(input, SlantDirection::Clockwise)
}

fn slant_anticlockwise(input: &str) -> String {
    slant(input, SlantDirection::AntiClockwise)
}

fn find_xmas_matches(input: &str) -> usize {
    let regex = Regex::new(r"XMAS").unwrap();

    regex.find_iter(input).count()
}

fn find_samx_matches(input: &str) -> usize {
    let regex = Regex::new(r"SAMX").unwrap();

    regex.find_iter(input).count()
}

fn words_amount(input_contents: &str) -> i32 {
    let normal = input_contents;
    let rotated_clockwise = rotate_clockwise(normal);
    let slanted_clockwise_rotated_clockwise = rotate_clockwise(&slant_clockwise(normal));
    let slanted_anticlockwise_rotated_clockwise = rotate_clockwise(&slant_anticlockwise(normal));

    [
        find_xmas_matches(normal),
        find_xmas_matches(&rotated_clockwise),
        find_xmas_matches(&slanted_clockwise_rotated_clockwise),
        find_xmas_matches(&slanted_anticlockwise_rotated_clockwise),
        find_samx_matches(normal),
        find_samx_matches(&rotated_clockwise),
        find_samx_matches(&slanted_clockwise_rotated_clockwise),
        find_samx_matches(&slanted_anticlockwise_rotated_clockwise),
    ]
    .iter()
    .sum::<usize>() as i32
}

fn crosses_amount(input_contents: &str) -> i32 {
    let lines = input_contents.lines().collect::<Vec<_>>();
    let rows = lines.len();
    let cols = lines[0].len();
    let chars = lines
        .iter()
        .map(|line| line.chars().collect::<Vec<_>>())
        .collect::<Vec<_>>();

    (1..(cols - 1))
        .flat_map(|i| {
            (1..(rows - 1)).filter({
                let chars = &chars;

                move |j| {
                    matches!(
                        (
                            chars[i - 1][*j - 1],
                            chars[i - 1][*j + 1],
                            chars[i][*j],
                            chars[i + 1][*j - 1],
                            chars[i + 1][*j + 1],
                        ),
                        ('M', 'M', 'A', 'S', 'S')
                            | ('S', 'S', 'A', 'M', 'M')
                            | ('M', 'S', 'A', 'M', 'S')
                            | ('S', 'M', 'A', 'S', 'M')
                    )
                }
            })
        })
        .count() as i32
}

#[cfg(test)]
mod tests {
    use super::*;

    const INPUT_PART_1: &str = include_str!("../../../../../inputs/2024/04/test_input_part_1");
    const INPUT_PART_2: &str = include_str!("../../../../../inputs/2024/04/test_input_part_2");

    #[test]
    fn test_part_1() {
        assert_eq!(part_1(INPUT_PART_1), 18);
    }

    #[test]
    fn test_part_2() {
        assert_eq!(part_2(INPUT_PART_2), 9);
    }
}
