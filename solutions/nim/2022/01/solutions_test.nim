import os
import solutions
import std/strformat
import std/unittest

const input = fmt"{currentSourcePath.parentDir()}/../../../../inputs/2022/01/test_input".staticRead()

suite "Solutions202201Test":
  test ".part_1":
    check(part_1(input) == 24000)
  test ".part_2":
    check(part_2(input) == 45000)
