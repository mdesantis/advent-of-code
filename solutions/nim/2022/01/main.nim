import os
import std/strformat
import solutions

const input = fmt"{currentSourcePath.parentDir()}/../../../../inputs/2022/01/input".staticRead()

echo fmt"[2022/01/1] {part_1(input)}"
echo fmt"[2022/01/2] {part_2(input)}"
