require 'test_helper'

module Wiki
  class SectionTest < Minitest::Test

    include ::Wiki::MockWiki

    def setup
      wiki_initialize
      @section = Section.new(@directory_1)
    end

    def teardown
      wiki_destroy
    end

    def test_section_initialization
      section = Section.new(@directory_2)
      assert true, section.is_a?(Section)
    end

    def test_section_creation_is_controllable_using_ignore_directories
      File.open("#{@project_root}/.ignore_directories", 'w') do |file|
        file.write "vendor"
        file.write "{@directory_2}"
      end
      Configuration.project_root = File.expand_path("#{@project_root}")
      Configuration.ignore_dirs = File.open("#{@project_root}/.ignore_directories")
      require 'pry'; binding.pry
      assert false, ::Wiki::Section.subdirectory_list.include?(@directory_2)
    end
  end
end
