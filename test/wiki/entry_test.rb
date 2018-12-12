require 'test_helper'
require 'front_matter_parser'

module Wiki
  class EntryTest < Minitest::Test

    include ::Wiki::MockWiki

    def setup
      wiki_initialize
      @entry = Entry.new(@entry_1)
    end

    def teardown
      wiki_destroy
    end

    def test_entry_initialization
      entry = Entry.new(@entry_2)
      assert true, entry.is_a?(Entry)
    end

    def test_entry_file_variable
      assert @entry.file, @entry_1
    end

    def test_entry_metadata
      file = ::FrontMatterParser::Parser.parse_file(@entry.file)
      title = file.front_matter['title']
      description = file.front_matter['description']

      assert @entry.title, title
      assert @entry.description, description
    end
  end
end
