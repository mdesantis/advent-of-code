# frozen_string_literal: true

module Solutions202208
  class Part1
    attr_reader :grid, :last_column_index, :last_row_index

    def initialize(input)
      @grid = input.split("\n").map { |row| row.chars.map(&:to_i) }.freeze
      @last_column_index = grid.size - 1
      @last_row_index = grid.first.size - 1
    end

    def edge?(column_i, row_i)
      column_i.zero? || row_i.zero? || column_i == last_column_index || row_i == last_row_index
    end

    def visible_from_top?(height, column_i, row_i)
      grid[0..(column_i - 1)].all? { |v| v[row_i] < height }
    end

    def visible_from_right?(height, column_i, row_i)
      grid[column_i][(row_i + 1)..last_column_index].all? { |v| v < height }
    end

    def visible_from_bottom?(height, column_i, row_i)
      grid[(column_i + 1)..last_row_index].all? { |v| v[row_i] < height }
    end

    def visible_from_left?(height, column_i, row_i)
      grid[column_i][0..(row_i - 1)].all? { |v| v < height }
    end

    def trees_visible_from_outside_the_grid_size
      grid.each_with_index.sum do |row, column_i|
        row.each_with_index.count do |height, row_i|
          edge?(column_i, row_i) ||
            visible_from_top?(height, column_i, row_i) ||
            visible_from_left?(height, column_i, row_i) ||
            visible_from_bottom?(height, column_i, row_i) ||
            visible_from_right?(height, column_i, row_i)
        end
      end
    end
  end

  class Part2
    attr_reader :grid, :last_column_index, :last_row_index

    def initialize(input)
      @grid = input.split("\n").map { |row| row.chars.map(&:to_i) }.freeze
      @last_column_index = grid.size - 1
      @last_row_index = grid.first.size - 1
    end

    def edge?(column_i, row_i)
      column_i.zero? || row_i.zero? || column_i == last_column_index || row_i == last_row_index
    end

    def count_while(enumerable)
      enumerable.reduce(0) do |acc, v|
        break acc + 1 unless yield v

        acc + 1
      end
    end

    def top_viewing_distance(height, column_i, row_i)
      count_while((column_i - 1).downto(0)) { |current_column_i| grid[current_column_i][row_i] < height }
    end

    def right_viewing_distance(height, column_i, row_i)
      count_while(grid[column_i][(row_i + 1)..last_column_index]) { |around_height| around_height < height }
    end

    def bottom_viewing_distance(height, column_i, row_i)
      count_while((column_i + 1)..last_row_index) { |current_column_i| grid[current_column_i][row_i] < height }
    end

    def left_viewing_distance(height, column_i, row_i)
      count_while((row_i - 1).downto(0)) { |current_row_i| grid[column_i][current_row_i] < height }
    end

    def scenic_score(top_viewing_distance, right_viewing_distance, bottom_viewing_distance, left_viewing_distance)
      top_viewing_distance * right_viewing_distance * bottom_viewing_distance * left_viewing_distance
    end

    def max_scenic_score
      grid.each_with_index.with_object([]) do |(row, column_i), scenic_scores|
        row.each_with_index do |height, row_i|
          # Skip edges as their scenic score is `0`
          next if edge?(column_i, row_i)

          scenic_scores << scenic_score(
            top_viewing_distance(height, column_i, row_i),
            right_viewing_distance(height, column_i, row_i),
            bottom_viewing_distance(height, column_i, row_i),
            left_viewing_distance(height, column_i, row_i)
          )
        end
      end.max
    end
  end

  def self.part_1(input)
    Part1.new(input).trees_visible_from_outside_the_grid_size
  end

  def self.part_2(input)
    Part2.new(input).max_scenic_score
  end
end
