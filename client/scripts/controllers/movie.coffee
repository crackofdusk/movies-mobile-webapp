define ['zepto', '../helpers/youtube_helper'], ($, YouTube) ->
  class MovieController
    constructor: (@movie) ->

    toggleWatchlist: (watchlist) ->
      console.log watchlist
      watchlist.selected = !watchlist.selected

    displayWatchlists: (model, element) ->
      $('.watchlists').addClass('edit')
      element.parentNode.removeChild(element)

    watchTrailer: (model, element) ->
      url = element.href
      player = new YouTube(url, 'trailer')

      $('.collapsable').addClass('collapsed')
      $('.darkable').addClass('dark')
      $('.player').removeClass('collapsed')

      player.play()

  return MovieController
