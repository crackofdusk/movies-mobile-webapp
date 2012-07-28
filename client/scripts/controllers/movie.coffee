define ['zepto'], ($) ->
  class MovieController
    constructor: (@movie) ->

    toggleWatchlist: (watchlist) ->
      console.log watchlist
      watchlist.selected = !watchlist.selected

    displayWatchlists: (model, element) ->
      $('.watchlists').addClass('edit')
      element.parentNode.removeChild(element)


  return MovieController
