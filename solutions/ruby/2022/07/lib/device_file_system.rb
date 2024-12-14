# frozen_string_literal: true

module Solutions202207
  class DeviceFileSystem
    DISK_SPACE = 70_000_000
    MINIMUM_FREE_SPACE_REQUIRED = 30_000_000

    def initialize(commands)
      @tree = { '/' => {} }
      @current_branch = @tree
      @parent_branches = []

      apply_commands commands
    end

    def dir_sizes_lt_100_000_sum(dir = @tree)
      dir.values.reduce(0) do |acc, item|
        next acc if item.is_a?(Numeric)

        size = dir_size(item)

        acc += size if size < 100_000

        acc + dir_sizes_lt_100_000_sum(item)
      end
    end

    def candidate_dirs_for_deletion_sizes(dir = @tree)
      @minimum_space_to_be_freed = minimum_space_to_be_freed

      dir.values.reduce([]) do |acc, item|
        next acc if item.is_a?(Numeric)

        size = dir_size(item)

        acc.push size if size >= @minimum_space_to_be_freed

        acc.push(*candidate_dirs_for_deletion_sizes(item))
      end
    end

    private

    def minimum_space_to_be_freed
      total_amount_of_used_space = dir_size @tree
      -(DISK_SPACE - MINIMUM_FREE_SPACE_REQUIRED - total_amount_of_used_space)
    end

    def dir_size(dir)
      dir.values.sum { |v| v.is_a?(Hash) ? dir_size(v) : v }
    end

    def apply_commands(commands)
      commands.each do |line|
        case line
        # when '$ ls' # noop
        when /^dir (.+)$/
          create_dir Regexp.last_match(1)
        when /^\$ cd (.+)$/
          apply_cd_command Regexp.last_match(1)
        when /^(\d+) (.+)$/
          create_file Regexp.last_match(2), Regexp.last_match(1).to_i
        end
      end
    end

    def apply_cd_command(match)
      case match
      when '/'
        change_dir_to_root
      when '..'
        change_dir_to_parent
      else
        change_dir_to_sibling match
      end
    end

    def create_dir(name)
      @current_branch[name] = {}
    end

    def change_dir_to_sibling(name)
      @parent_branches.push @current_branch
      @current_branch = @current_branch[name]
    end

    def change_dir_to_parent
      @current_branch = @parent_branches.pop
    end

    def change_dir_to_root
      @parent_branches = []
      @current_branch = @tree['/']
    end

    def create_file(name, size)
      @current_branch[name] = size
    end
  end
end
