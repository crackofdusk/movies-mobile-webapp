require 'sinatra/base'
require 'sinatra/assetpack'

module Moviesio
  module Assets

    def self.included(klass)
      klass.register Sinatra::AssetPack

      klass.assets {

        js :requirejs, [
          '/js/lib/require.js'
        ]

        css :base, [
          '/css/normalize.css',
          '/css/fonts.css',
          '/css/application.base.css',
          '/css/movie/movie.base.css',
        ]

        css :desktop, [
          '/css/application.desktop.css',
          '/css/movie/movie.desktop.css',
        ]

        css :phone, [
          '/css/application.phone.css',
          '/css/movie/movie.phone.css',
        ]
      
      }
    end
  end
end
