define ['module', 'zepto'], (module, $) ->
  {

    fetch: (url, callback) ->
      bootstrap = module.config()
      if bootstrap.valid
        console.log("Using bootstrapped data.")
        callback(bootstrap.model)
        bootstrap.valid = false
      else
        console.log("Retreiving data from the server.")
        $.getJSON url, (data) ->
          callback(data)

  }

