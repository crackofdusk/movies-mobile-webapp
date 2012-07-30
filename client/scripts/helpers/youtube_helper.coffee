define ['./video_helper'], (Player) ->
  class YouTubePlayer
    constructor: (@url, container) ->
      @position =  0

      options = {
        file: @url
        flashplayer: '/flash/player.swf'
        dock: true
        quality: true
        start: @position
        width: '100%'
        height: '100%'

        skin: '/flash/bekle.zip'
        displayclick: 'fullscreen'
      }

      options.plugins = {
        'hd-2': {
          file: @url
          state: true
        }
      }

      @player = new Player(container, options)

    play: ->
      @player.play()

    pause: ->
      @player.pause()

    togglePlayback: ->
      @player.togglePlayback()


  return YouTubePlayer
