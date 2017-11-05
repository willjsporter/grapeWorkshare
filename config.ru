$LOAD_PATH.unshift File.expand_path '..', __FILE__

require 'app'

run Rack::Cascade.new [Web, API::App]

# run API::API
