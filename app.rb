require 'grape'
require 'rack'

ENV['RACK_ENV'] ||= 'development'

module API
  class App < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    def self.recall_set_time
      @api_time
    end

    def self.manual_set_time(time, date = "")
      @api_time = Time.parse(date + " " + time)
    end

    before do
      @api_time = App.recall_set_time
    end

    get :hello do
      {hello: "world"}
    end

    get :gettime do
      if @api_time
        { time: @api_time }
      else
        { time: Time.now }
      end
    end

    desc "Alter the time"
    params do
      requires :time, type: String
      optional :date, type: String
    end
    post :settime do
      if params[:date].nil?
        App.manual_set_time(params[:time])
        # @api_time = Time.parse(params[:time])
      else
        App.manual_set_time(params[:time], params[:date])
        # @api_time = Time.parse(params[:date] + " " + params[:time])
      end
    end

  end
end

require 'sinatra'

class Web < Sinatra::Base

  get '/hello' do
    # {hello: "world"}.to_json
    erb :hello
  end

  get '/gettime' do
    content_type :json
    if $user_set_time_web
      { time: $user_set_time_web }.to_json
    else
      { time: Time.now }.to_json
    end
  end

  get '/settime' do
    erb :settime
  end

  post '/settime' do
    content_type :json
    $user_set_time_web = Time.new(params[:year], params[:month], params[:day], params[:hour], params[:minute], params[:second] )
    # $user_set_time = DateTime.parse(params[:time])
    redirect '/gettime'
  end

end

use Rack::Session::Cookie
