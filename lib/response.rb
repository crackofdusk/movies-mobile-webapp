require 'sinatra/respond_with'
require 'sinatra/json'

module Moviesio
  module ResponseHelper

    def self.included(klass)
      klass.register Sinatra::RespondWith
      klass.helpers Sinatra::JSON

      klass.respond_to :html, :json
    end

    def respond(view, object)
      respond_to do |r|
        r.html { erb view, :locals => { :model => object } }
        r.json { object.to_json }
      end
    end

  end
end
