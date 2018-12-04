require 'random-word'
require 'stringio'
require 'tmpdir'

module Wiki
  module MockWiki

    def wiki_initialize
      @project_root = Dir.mktmpdir("project_root")
      nouns = 10.times.map { "#{RandomWord.nouns.next}" }
      nouns.each { |noun| new_subdirectory(noun) }
      @directory_1 = wiki_directories[1]
      @directory_2 = wiki_directories[-1]
      @entry_1 = wiki_entries[0]
      @entry_2 = wiki_entries[-1]
    end

    def wiki_destroy
      FileUtils.remove_entry(@project_root)
    end

    def wiki_directories
      Dir.glob("#{@project_root}/*")
    end

    def wiki_entries
      Dir.glob("#{@project_root}/**/**/*.md")
    end

    def new_subdirectory(subdir)
      path = File.join("#{@project_root}", subdir)
      Dir.mkdir(path)
      new_file(path, "README.md")
      10.times { new_file(path) }
    end

    def new_file(dir_name, filename="#{random_filename}")
      path = File.join(dir_name, filename)
      File.open(path, 'w') do |f|
        f.write file_contents filename
      end
    end

    def random_filename
      "#{RandomWord.adjs.next}-#{RandomWord.nouns.next}.md"
    end

    def titleize(random_filename)
      random_filename.gsub('-', ' ').gsub('.md', '')
    end

    def file_contents(filename)
      "--- \n" \
      "title: #{titleize filename} \n" \
      "description: Just a short description. \n" \
      "--- \n\n" \
      "# #{titleize filename} \n\n" \
      "Just a single sentence of content for now."
    end

  end
end
