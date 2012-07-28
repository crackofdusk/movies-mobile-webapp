define ['serenade', './movie'], (Serenade, Movie) ->
  class Watchlist extends Serenade.Model
    @hasMany 'movies', as: (-> Movie)

  return Watchlist
