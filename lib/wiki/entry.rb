require 'front_matter_parser'

module Wiki
  class Entry
    attr_reader :file, :title, :description, :sort_order, :is_readme

    def initialize(filename)
      @file = filename
      @title = metadata['title'] || frontmatter_undefined
      @description = metadata['description'] || frontmatter_undefined
    end

    private

    def frontmatter_undefined
      "Frontmatter undefined for " \
      "#{filename - ::Wiki::Configuration.project_root}"
    end

    def metadata
      file = ::FrontMatterParser::Parser.parse_file(@file)
      file.front_matter
    end

  end
end
