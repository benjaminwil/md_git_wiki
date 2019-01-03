require 'wiki/configuration'
require 'wiki/entry'
require 'wiki/section'

module Wiki

  Configuration.config do
    parameter :ignore_dirs
    parameter :project_readme
    parameter :project_root
    parameter :project_sections
    parameter :valid
  end

  if Configuration.project_root
    root = Configuration.project_root
    Configuration.ignore_dirs = File.expand_path File.join(root, '.ignore_directories')
    Configuration.project_readme = File.expand_path File.join(root, 'README.md')
    Configuration.project_sections = File.expand_path File.join(root, 'wiki.yml')
    Configuration.valid = true
  else
    Configuration.valid = false
  end

end
