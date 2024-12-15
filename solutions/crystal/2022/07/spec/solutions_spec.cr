require "spec"
require "../src/solutions"

input = <<-TXT
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k

TXT

describe Solutions202207 do
  describe ".part_1" do
    it { Solutions202207.part_1(input).should eq 95437 }
  end

  describe ".part_2" do
    it { Solutions202207.part_2(input).should eq 24933642 }
  end
end
