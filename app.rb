require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/content_for'

require './lib/assets'
require './lib/response'
require './lib/api'

module Moviesio
  class WebApp < Sinatra::Base
    register Sinatra::ConfigFile
    helpers Sinatra::ContentFor

    include Moviesio::ResponseHelper
    include Moviesio::Assets

    # Setup

    config_file File.expand_path('../config/api.yml', __FILE__)

    set :layout_engine, :erb


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
      respond :movie, @moviesio.movie(params[:id])
    end

  end
end
