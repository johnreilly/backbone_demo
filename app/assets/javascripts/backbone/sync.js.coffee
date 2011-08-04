Backbone.syncHelpers =
  methodMap:
    'create': 'POST'
    'update': 'PUT'
    'delete': 'DELETE'
    'read'  : 'GET'


  getUrl: (object) ->
    if !(object && object.url)
      return null
    else
      return if _.isFunction(object.url) then object.url() else object.url


  urlError: ->
    throw new Error("A 'url' property or function must be specified")


Backbone.sync = (method, model, options) ->

  type = Backbone.syncHelpers.methodMap[method]

  # Default JSON-request options.
  params = _.extend({
    type:         type,
    dataType:     'json',
    processData:  false,
    beforeSend: ( xhr ) ->
      token = $('meta[name="csrf-token"]').attr('content')
      if (token) then xhr.setRequestHeader('X-CSRF-Token', token)

    }, options)

  if !params.url
    params.url = Backbone.syncHelpers.getUrl(model) || Backbone.syncHelpers.urlError()

  # Ensure that we have the appropriate request data.
  if (!params.data && model && (method == 'create' || method == 'update'))
    params.contentType = 'application/json'

    data = {}

    if(model.paramRoot)
      data[model.paramRoot] = model.toJSON()
    else
      console.warn "No paramRoot specified!"
      data = model.toJSON()

    params.data = JSON.stringify(data)

  # Make the request.
  return $.ajax(params)
