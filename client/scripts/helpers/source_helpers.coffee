define () ->

  class SourceHelpers
    constructor: ->

    attachTo: (serenade) ->
      serenade.Helpers.subtitles = @subtitles

    subtitles: ->
      link = "http://subscene.com/subtitles/release.aspx?q=#{encodeURIComponent(@model.name)}"
      a = document.createElement('a')
      a.setAttribute('href', link)
      a.setAttribute('target', '_blank')
      a.innerText = 'Subtitles'

      a


  {
    initialize: (serenade) ->
      helpers = new SourceHelpers(document)
      helpers.attachTo(serenade)
  }

