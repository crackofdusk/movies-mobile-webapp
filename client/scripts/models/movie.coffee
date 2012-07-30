define ['serenade', './watchlist', './torrent'], (Serenade, Watchlist, Torrent) ->
  class Movie extends Serenade.Model
    @hasMany 'watchlists', as: (-> Watchlist)
    @hasMany 'torrents', as: (-> Torrent)

    # listing properties that need special formatting
    @property 'runtime', {
      format: (minutes) ->
        if minutes > 60
          # nothing fancy, it's not worth it
          "#{~~(minutes / 60)} hrs #{minutes % 60} mins"
        else
          "#{minutes} mins"
    }

    constructor: (data) ->
      super data

      @set('torrents', data.sources.torrents)




  return Movie
