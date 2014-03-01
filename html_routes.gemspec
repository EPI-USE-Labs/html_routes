$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'html_routes/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'html_routes'
  s.version     = HtmlRoutes::VERSION
  s.authors     = ['Pierre Pretorius']
  s.email       = ['pierre@labs.epiuse.com']
  s.homepage    = 'https://github.com/pierre-pretorius/activesupport-decorators'
  s.summary     = 'Adds the decorator pattern to activesupport class loading.'
  s.description = 'Useful when extending functionality with Rails engines.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 2.3'
  s.add_dependency 'syntax', '~> 1.1'
  s.add_dependency 'launchy'
end
