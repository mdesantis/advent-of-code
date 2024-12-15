import math
import sequtils
import strutils
import sugar
import algorithm

proc part_1*(input: string): int =
  input.strip(leading = false).split("\n\n").map(
    (calories_list) => calories_list.split("\n").map((calories) => calories.parseInt()).sum()
  ).max()

proc part_2*(input: string): int =
  input.strip(leading = false).split("\n\n").map(
    (calories_list) => calories_list.split("\n").map((calories) => calories.parseInt()).sum()
  ).sorted(order = SortOrder.Descending)[0..2].sum()
