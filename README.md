Rails HtmlRoutes
================

Output your Rails routes to html:

![HTML Routes](./example.png "HtmlRoutes")

## Installation

Add to gemfile:

```ruby
gem 'html_routes'
```

## Usage

```bash
rake html_routes
```

Specify a custom output file:

```bash
rake html_routes out=tmp/custom_file.html
```

If you don't want to open it in your browser automatically:

```bash
rake html_routes background=true
```