require 'grape'
require 'rack'

ENV['RACK_ENV'] ||= 'development'

module API
  class App < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    get :hello do
      {hello: "world"}
    end

  end
end
