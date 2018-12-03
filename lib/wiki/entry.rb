require 'front_matter_parser'

module Wiki
  class Entry
    attr_reader :file, :title, :description, :sort_order, :is_readme
    
    def initialize(filename)
      @file = filename
      @title = metadata['title']
      @description = metadata['description']
    end
    
    private

    def metadata
      file = ::FrontMatterParser::Parser.parse_file(@file)
      file.front_matter
    end

  end
end
