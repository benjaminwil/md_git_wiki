module Wiki
  class Section

    def initialize(section)
      @title = section
      @path = "#{Configuration.project_root}/#{section}" if Configuration.project_root
      @entries = Array.new

      markdown_files.each do |filename|
        entry = Entry.new(filename)
        @entries << entry
      end
    end

    class << self
      def all
        ObjectSpace.each_object(self).to_a
      end

      def subdirectory_list
        root = Configuration.project_root
        ignore_dirs = Regexp.union File.open(Configuration.ignore_dirs).map { |d| d.chomp.to_s }
        dirs = Dir.glob("#{root}/*").select { |file| File.directory?(file) }
        dirs.select { |d| !d.match?(ignore_dirs) }
      end
    end

    private

    def markdown_files
      Dir.glob File.join(@path, "*.md")
    end
  end
end
