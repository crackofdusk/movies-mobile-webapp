define ['jwplayer'], (jwplayer) ->

  class VideoHelper
    constructor: (container, options) ->
      @player = jwplayer(container)
      @player.setup(options)

    play: ->
      @player.play(true)

    pause: ->
      @player.pause(true)

    togglePlayback: ->
      @player.play()


  return VideoHelper
