require.config {
  paths: {
    text:       'lib/text'
    serenade:   'lib/serenade'
    zepto:      'lib/zepto'
    leviroutes: 'lib/routes'
    jwplayer:   'lib/jwplayer'
  },
  shim: {
    zepto: {
      exports: 'Zepto'
    },
    leviroutes: {
      exports: 'routes'
    },
    jwplayer: {
      exports: 'jwplayer'
    }
  }
}

require ['router'], (router) ->
  router.initialize(document.querySelector("#app"))
