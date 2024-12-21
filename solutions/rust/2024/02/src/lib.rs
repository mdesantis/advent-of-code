use std::cmp::Ordering;

pub fn part_1(input: &str) -> i32 {
    safe_reports_amount(input, false)
}

pub fn part_2(input: &str) -> i32 {
    safe_reports_amount(input, true)
}

fn is_report_safe(levels: &[i32]) -> bool {
    let prev_level = levels[0];
    let mut prev_report_ordering = prev_level.cmp(&levels[1]);

    for pair in levels.windows(2) {
        let (current, next) = (pair[0], pair[1]);
        let report_ordering = current.cmp(&next);

        if report_ordering == Ordering::Equal || current.abs_diff(next) > 3 {
            return false;
        }

        if report_ordering != prev_report_ordering {
            return false;
        }

        prev_report_ordering = report_ordering;
    }

    true
}

fn problem_dampener_levels<'a>(levels: &'a [i32]) -> impl Iterator<Item = Vec<i32>> + 'a {
    (0..levels.len()).map(|i| {
        let mut problem_dampener_level = levels.to_vec();

        problem_dampener_level.remove(i);

        problem_dampener_level
    })
}

fn safe_reports_amount(input_contents: &str, problem_dampener_module_enabled: bool) -> i32 {
    input_contents
        .lines()
        .filter_map(|line| {
            let levels = line
                .split_whitespace()
                .map(|slice| slice.parse::<i32>().unwrap())
                .collect::<Vec<_>>();

            if is_report_safe(&levels) {
                return Some(());
            }

            if problem_dampener_module_enabled {
                return problem_dampener_levels(&levels)
                    .any(|levels| is_report_safe(&levels))
                    .then_some(());
            }

            None
        })
        .count() as i32
}

#[cfg(test)]
mod tests {
    use super::*;

    const INPUT: &str = include_str!("../../../../../inputs/2024/02/test_input");

    #[test]
    fn test_part_1() {
        assert_eq!(part_1(INPUT), 2);
    }

    #[test]
    fn test_part_2() {
        assert_eq!(part_2(INPUT), 4);
    }
}
