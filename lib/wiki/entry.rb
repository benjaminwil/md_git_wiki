require 'front_matter_parser'

module Wiki
  class Entry
    attr_reader :file, :is_readme

    def initialize(@file)
      @is_readme = false unless @file.match? /README\.md/
    end

    def title
      metadata['title'] || frontmatter_undefined
    end

    def description
      metadata['description'] || frontmatter_undefined
    end

    class << self
      def all
        ObjectSpace.each_object(self).to_a
      end
    end

    private

    def frontmatter_undefined
      "Frontmatter undefined for " \
      "#{@file.gsub(::Wiki::Configuration.project_root, '')}"
    end

    def metadata
      file = ::FrontMatterParser::Parser.parse_file(@file)
      file.front_matter
    end

  end
end
