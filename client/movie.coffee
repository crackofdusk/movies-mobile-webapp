define ['serenade', 'text!/js/views/movie.serenade', 'zepto'], (Serenade, view, $) ->

  getMovie = (id, callback) ->
    $.getJSON "/m/#{id}", (data) ->
      callback(data)

  render = (id, callback) ->
    getMovie id, (data) ->
      element = Serenade.view(view).render(data)
      callback(element)


  {
    initialize: (id, callback) ->
      render(id, callback)
  }

