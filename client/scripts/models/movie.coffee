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

      # TODO: remove test data
      watchlists = [
        {
          name: "Here's a longer one"
          selected: true
        }
        {
          name: "wowser"
          selected: true
        }
        {
          name: "how do you like me now, huh?"
          selected: false
        }
        {
          name: "do not watch"
          selected: false
        }
        {
          name: "No way in hell"
          selected: false
        }
        {
          name: "way"
          selected: true
        }
        {
          name: "whatever"
          selected: false
        }
        {
          name: "really"
          selected: false
        }
      ]

      @get('watchlists').update(watchlists)
      @set('torrents', data.sources.torrents)




  return Movie
