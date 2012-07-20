require 'hashie'
require 'faraday'
require 'faraday_middleware'

module Moviesio

  class Client

    def initialize(options={})
      @api_url = options[:url] || 'http://api.movies.io'
      connection(options)
    end

    def connection(options={})
      config = {
        :url => @api_url
      }.merge(options)

      @connection ||= Faraday.new(config) do |builder|
        builder.adapter Faraday.default_adapter

        builder.request :url_encoded

        builder.response :mashify
        builder.response :json
      end
    end

    def movie(id, options={})
      response = connection.get "/movies/#{id}", options
      response.body.movie
    end

    def movies(search_param, options={})
      response = connection.get "/movies/search", options.merge(:q => search_param)
      response.body.movies
    end
  end

end
