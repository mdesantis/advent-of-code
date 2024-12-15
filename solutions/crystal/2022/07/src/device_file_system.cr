module Solutions202207
  class DeviceFileSystem
    alias FileSize = Int32
    alias FileName = String
    alias Directory = Hash(FileName, DeviceItem)
    alias Branch = Array(DeviceItem)

    record DeviceItem, value : FileSize | Directory do
      def is_file_size?
        value.is_a?(FileSize)
      end

      def is_directory?
        value.is_a?(Directory)
      end

      def file_size
        value.as(FileSize)
      end

      def directory
        value.as(Directory)
      end

      def directory_size
        directory.values.sum do |sub_item|
          sub_item.is_file_size? ? sub_item.file_size : sub_item.directory_size
        end
      end
    end

    DISK_SPACE                  = 70_000_000
    MINIMUM_FREE_SPACE_REQUIRED = 30_000_000

    @tree = DeviceItem.new({"/" => DeviceItem.new(Directory.new)})
    @parent_branches = Branch.new
    @minimum_space_to_be_freed : Int32

    def initialize(commands : Array(String))
      @current_branch = @tree

      apply_commands commands
      @minimum_space_to_be_freed = minimum_space_to_be_freed
    end

    def directory_sizes_less_than_100_000_sum(item = @tree)
      item.directory.values.reduce(0) do |acc, item|
        next acc if item.is_file_size?

        size = item.directory_size

        acc += size if size < 100_000
        acc + directory_sizes_less_than_100_000_sum(item)
      end
    end

    def candidate_directories_for_deletion_sizes(item = @tree)
      item.directory.values.reduce([] of Int32) do |acc, item|
        next acc if item.is_file_size?

        size = item.directory_size

        acc.push size if size >= @minimum_space_to_be_freed

        acc.concat candidate_directories_for_deletion_sizes(item)
      end
    end

    private def minimum_space_to_be_freed
      total_amount_of_used_space = @tree.directory_size
      -(DISK_SPACE - MINIMUM_FREE_SPACE_REQUIRED - total_amount_of_used_space)
    end

    private def apply_commands(commands)
      commands.each do |line|
        if match_data = line.match(/^dir (.+)$/)
          create_directory match_data[1]
        elsif match_data = line.match(/^\$ cd (.+)$/)
          apply_cd_command match_data[1]
        elsif match_data = line.match(/^(\d+) (.+)$/)
          create_file match_data[2], match_data[1].to_i
        end
      end
    end

    private def create_directory(name)
      @current_branch.directory[name] = DeviceItem.new(Directory.new)
    end

    private def apply_cd_command(match)
      case match
      when "/"
        change_directory_to_root
      when ".."
        change_directory_to_parent
      else
        change_directory_to_sibling match
      end
    end

    private def change_directory_to_sibling(name)
      @parent_branches.push @current_branch
      @current_branch = @current_branch.directory[name]
    end

    private def change_directory_to_parent
      @current_branch = @parent_branches.pop
    end

    private def change_directory_to_root
      @parent_branches = Branch.new
      @current_branch = @tree.directory["/"]
    end

    private def create_file(name, size)
      @current_branch.directory[name] = DeviceItem.new(size)
    end
  end
end
