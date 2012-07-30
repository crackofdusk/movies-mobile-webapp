define [
  'serenade'
  'text!/js/views/movie.serenade'
  'data'
  'models/movie'
  'controllers/movie'
  'helpers/movie_helpers'
  'helpers/source_helpers'
], (Serenade, view, data, Movie, MovieController, movieHelpers, sourceHelpers) ->

  movie = null

  fetch = (id, callback) ->
    data.fetch "/m/#{id}", (result) ->
      callback(result)


  render = (model, callback) ->
      element = Serenade.view(view).render(model, MovieController)
      callback(element)


  {
    initialize: (id, callback) ->
      unless movie
        movieHelpers.initialize(Serenade)
        sourceHelpers.initialize(Serenade)

      fetch id, (data) ->
        # For some reason both of these are needed for proper updating. Need to
        # investigate…
        movie = new Movie(data)
        movie.set(data)

        render(movie, callback)
  }

