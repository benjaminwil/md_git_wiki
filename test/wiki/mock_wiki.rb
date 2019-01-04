require 'tmpdir'

module Wiki
  module MockWiki

    def create_mock_wiki
      require 'pry'
      binding.pry
      @wiki = Dir.mktmpdir('wiki')
      contents = File.open(File.join File.expand_path("#{__FILE__}/../../mock_wiki"), '/.')
      FileUtils.copy_entry(contents, @wiki)
      generate_entries
      return @wiki
    end

    def destroy_mock_wiki
      FileUtils.remove_entry(@wiki)
    end

    def directories
      Dir.glob("#{@wiki}/*").select { |dir| File.directory?(dir) }
    end

    def entries
      Dir.glob("#{@wiki}/**/**/*.md")
    end

    def readmes
      Dir.glob("#{@wiki}/**/**/README.md")
    end

    def generate_entries
      entries.each { |e| ::Wiki::Entry.new(e) }
    end

  end
end
