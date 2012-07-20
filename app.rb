require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/config_file'
require 'sinatra/respond_with'
require 'sinatra/json'

require './lib/api'

module Moviesio
  class WebApp < Sinatra::Base
    register Sinatra::ConfigFile
    helpers Sinatra::JSON
    register Sinatra::RespondWith


    # Setup

    config_file File.expand_path('../config/api.yml', __FILE__)

    configure :development do
      register Sinatra::Reloader
    end

    set :layout_engine, :erb

    respond_to :html, :json


    # Filters
    
    before do
      @moviesio = Moviesio::Client.new(:url => settings.api_url)
    end


    # Routes
    
    get '/' do
      respond_to do |r|
        r.html { erb "Hello, world!" }
        r.json { json :response => { :message => 'Hello, world!' } }
      end
    end

    get '/m/:id' do
      movie = @moviesio.movie(params[:id])

      respond_to do |r|
        r.html { erb "Loading..." }
        r.json { movie.to_json }
      end
    end

  end
end
