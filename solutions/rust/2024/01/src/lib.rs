#![feature(iter_array_chunks, test)]

extern crate test;

pub fn part_1(input: &str) -> i32 {
    distances_sum(input)
}

pub fn part_2(input: &str) -> i32 {
    similarity_score(input)
}

fn lefts_and_rights(input: &str) -> (Vec<i32>, Vec<i32>) {
    input
        .lines()
        .flat_map(|line| line.split_whitespace().map(|v| v.parse::<i32>().unwrap()))
        .array_chunks::<2>()
        .map(|[left, right]| (left, right))
        .unzip()
}

fn distances_sum(input: &str) -> i32 {
    let (mut lefts, mut rights) = lefts_and_rights(input);

    lefts.sort();
    rights.sort();

    let distances_sum = lefts
        .iter()
        .zip(rights.iter())
        .fold(0, |acc, (left, right)| acc + left.abs_diff(*right));

    distances_sum as i32
}

fn similarity_score(input: &str) -> i32 {
    let (lefts, rights) = lefts_and_rights(input);

    let similarity_score = lefts.iter().fold(0, |acc, left| {
        let single_similarity_score = rights.iter().filter(|&right| right == left).count() as i32;

        acc + left * single_similarity_score
    });

    similarity_score
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::hint::black_box;
    use test::Bencher;

    const INPUT: &str = include_str!("../../../../../inputs/2024/01/test_input");
    const BENCH_INPUT: &str = include_str!("../../../../../inputs/2024/01/input");

    #[test]
    fn test_distances_sum() {
        let expected = 11;
        let actual = distances_sum(INPUT);
        assert_eq!(expected, actual);
    }

    #[test]
    fn test_similarity_score() {
        let expected = 31;
        let actual = similarity_score(INPUT);
        assert_eq!(expected, actual);
    }

    #[bench]
    fn bench_distances_sum(bencher: &mut Bencher) {
        bencher.iter(|| black_box(distances_sum(black_box(BENCH_INPUT))));
    }

    #[bench]
    fn bench_similarity_score(bencher: &mut Bencher) {
        bencher.iter(|| black_box(similarity_score(black_box(BENCH_INPUT))));
    }
}
