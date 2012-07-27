define [
  'serenade'
  'text!/js/views/movie.serenade'
  'data'
  'models/movie'
  'helpers/movie_helpers'
  'helpers/source_helpers'
], (Serenade, view, data, Movie, movieHelpers, sourceHelpers) ->

  render = (id, callback) ->
    data.fetch "/m/#{id}", (result) ->
      movie = new Movie(result)
      element = Serenade.view(view).render(movie)
      callback(element)


  {
    initialize: (id, callback) ->
      movieHelpers.initialize(Serenade)
      sourceHelpers.initialize(Serenade)
      render(id, callback)
  }

