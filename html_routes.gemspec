$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'html_routes/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'html_routes'
  s.version     = HtmlRoutes::VERSION
  s.authors     = ['Pierre Pretorius']
  s.email       = ['pierre@labs.epiuse.com']
  s.homepage    = 'https://github.com/pierre-pretorius/html_routes'
  s.summary     = 'Output your Rails routes to html.'
  s.description = 'Generate a syntax highligthed HTML file from your Rails routes.'
  s.license     = 'MIT'

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'README.md']

  s.add_dependency 'syntax', '~> 1.0'
  s.add_dependency 'launchy', '~> 2.0'
end
