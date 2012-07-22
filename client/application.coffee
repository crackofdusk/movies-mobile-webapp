require.config {
  paths: {
    text:       'lib/text'
    serenade:   'lib/serenade'
    zepto:      'lib/zepto'
    leviroutes: 'lib/routes'
  },
  shim: {
    zepto: {
      exports: 'Zepto'
    },
    leviroutes: {
      exports: 'routes'
    }
  }
}

require ['router'], (router) ->
  router.initialize(document.body)
