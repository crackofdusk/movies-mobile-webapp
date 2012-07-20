require.config {
  paths: {
    crossroads: 'lib/crossroads'
    signals:    'lib/signals'
    text:       'lib/text'
    serenade:   'lib/serenade'
    zepto:      'lib/zepto'
  },
  shim: {
    zepto: {
      exports: 'Zepto'

    }
  }
}

require ['router'], (router) ->
  router.initialize(document.body)
