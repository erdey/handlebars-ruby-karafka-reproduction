require 'handlebars-engine'

HandlebarsContext = Handlebars::Engine.new
HandlebarsContext.register_helper(:localize_category) do |ctx, arg, _opts|
  'background check'
end