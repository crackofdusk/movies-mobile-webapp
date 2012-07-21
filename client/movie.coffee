define ['serenade', 'text!/js/views/movie.serenade', 'data'], (Serenade, view, data) ->

  render = (id, callback) ->
    data.fetch "/m/#{id}", (result) ->
      element = Serenade.view(view).render(result)
      callback(element)


  {
    initialize: (id, callback) ->
      render(id, callback)
  }

