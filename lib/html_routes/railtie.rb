class RailsHtmlRoutes < Rails::Railtie
  VERSION = '1.0'

  rake_tasks do
    path = File.join(File.dirname(__FILE__), '../tasks/html_routes.rake')
    load path
  end
end
