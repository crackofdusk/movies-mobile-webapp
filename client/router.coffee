define ['crossroads'], (crossroads) ->

  class Router

    constructor: (@container) ->
      @router = crossroads.create()

    run: ->
      movie = @router.addRoute '/m/{id}', (id) =>
        require ['movie'], (m) =>
          m.initialize(id, @display)

      # parse current URL to decide what to do
      @router.parse(document.location.pathname)


    display: (element) =>
      @container.innerHTML = ""
      @container.appendChild(element)




  {
    initialize: (container) ->
      router = new Router(container)
      router.run()
  }

