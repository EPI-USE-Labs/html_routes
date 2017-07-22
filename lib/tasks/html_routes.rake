require 'syntax/convertors/html'
require 'launchy'

# Custom HTML output of rake routes.
task html_routes: :environment do
  out_file = ENV['out'] || File.join(Rails.root, 'tmp/routes.html')
  convertor = Syntax::Convertors::HTML.for_syntax 'ruby'

  File.open(out_file, 'w') do |f|
    f.puts '<html><head><title>Rails routes</title>
             <style type="text/css">
             body { background-color: #333; color: #FFF; }
             table { border: 1px solid #777; background-color: #111; }
             td, th { font-size: 11pt; text-align: left; padding-right: 10px; }
             th { font-size: 12pt; }
             pre { maring: 0; padding: 0; }
             .contrl_head { font-size: 14pt; padding: 15px 0 5px 0; }
             .contrl_name { color: #ACE; }
             .punct { color: #99F; font-weight: bold; }
             .symbol { color: #7DD; }
             .regex { color: #F66; }
             .string { color: #F99; }4
             </style></head>
             <body>'

    last_contrl = nil

    Rails.application.routes.routes.map do |route|
      unless route.requirements.empty?
        if route.requirements[:controller] != last_contrl
          f.puts '</table>' if last_contrl
          last_contrl = route.requirements[:controller]
          f.puts "<div class='contrl_head'><b>Controller: <span class='contrl_name'>#{last_contrl}</span></b></div>" +
                     "<table width='100%' border='0'><tr><th>Name</th><th>Verb</th><th>Path</th><th>Requirements</th></tr>"
        end

        reqs = route.requirements.inspect
        verb = route.verb.source
        verb = verb[1..(verb.length - 2)] if verb
        r = { name: route.name, verb: verb, path: route.path.spec.to_s, reqs: reqs }
        f.puts "<tr><td width='12%'><b>#{r[:name]}</b></td><td width='5%'><b>#{r[:verb]}</b></td>" +
                   "<td width='3%'>#{r[:path]}</td><td width='80%'>#{convertor.convert(r[:reqs])}</td></tr>"
      end
    end

    f.puts '</table></body></html>'

    puts "Generated routes to file://#{out_file}."
    unless ENV['background'] == 'true'
      Launchy.open("file://#{out_file}")
    end
  end
end
