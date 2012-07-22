define ['leviroutes'], (routes) ->

  class Router

    constructor: (@container) ->
      @app = new routes()

      @app.get '/m/:id', (req) =>
        require ['movie'], (m) =>
          m.initialize(req.params.id, @display)

    run: ->

    display: (element) =>
      @container.innerHTML = ""
      @container.appendChild(element)




  {
    initialize: (container) ->
      router = new Router(container)
      router.run()
  }

