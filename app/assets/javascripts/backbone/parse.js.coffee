# Inspired by: https://gist.github.com/719080

Backbone.parseHelpers =
  _paramRoot: ->
    throw new Error("A 'paramRoot' property must be specified.") if !@paramRoot
    @paramRoot

_.extend Backbone.Collection.prototype, Backbone.parseHelpers,

  # Collections from the API are rooted with a key: `{ messages: [...] }`
  # Pull out the array keyed by `paramRoot` which should be specified on the collection.
  parse: (resp) -> resp[@_paramRoot()]

_.extend Backbone.Model.prototype, Backbone.parseHelpers,

  # Models from the API are rooted with a key: `{ message: {...} }`
  # Pull out the object keyed by `paramRoot` which should be specified on the model.
  parse: (resp) -> resp[@_paramRoot()]

  # Models created by Collections will be created with the paramRoot. Unwrap the object
  # during initialization. This means any Models that override `initialize` must also call `super()`.
  initialize: (attrs, options) ->
    @set attrs[@_paramRoot()], { silent: true }
    @unset @_paramRoot(), { silent: true }
    @_previousAttributes = _.clone(@attributes)
