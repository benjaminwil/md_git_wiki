require 'wiki/configuration'
require 'wiki/entry'

module Wiki

  class Error < StandardError; end

  Configuration.config do
    parameter :project_root
    parameter :project_readme
  end

  unless Configuration.project_root
    puts 'Set a Wiki::Configuration.project_root value in your application. ' \
      'This should be the project directory where your root README.md is.'
  else
    Configuration.project_readme = File.expand_path File.join(Configuration.project_root, 'README.md')
  end

end
