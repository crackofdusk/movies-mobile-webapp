define () ->

  class MovieHelpers
    constructor: ->

    attachTo: (serenade) ->
      serenade.Helpers.rating = @rating
      serenade.Helpers.titleAndYear = @titleAndYear

    rating: ->
      score = @model.rating

      if score == 0.0 || isNaN(score)
        return document.createTextNode('Unrated')

      fullStar = '★'
      emptyStar = '☆'

      scoreStars = Array(Math.round(score) + 1).join(fullStar)
      padding = Array(11 - Math.round(score)).join(emptyStar)

      full = document.createElement('span')
      full.classList.add('full')
      full.appendChild(document.createTextNode(scoreStars))

      empty = document.createElement('span')
      empty.classList.add('empty')
      empty.appendChild(document.createTextNode(padding))

      container = document.createElement('span')
      container.appendChild(document.createTextNode(score))
      container.appendChild(full)
      container.appendChild(empty)

      container

    # TODO
    titleAndYear: ->
      title = @model.title
      year = @model.year


  {
    initialize: (serenade) ->
      helpers = new MovieHelpers(document)
      helpers.attachTo(serenade)
  }

