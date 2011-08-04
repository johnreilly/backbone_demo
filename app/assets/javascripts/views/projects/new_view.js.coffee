Demo.Views.Projects ||= {}

class Demo.Views.Projects.NewView extends Backbone.View
  template: JST["templates/projects/new"]

  events:
    "submit #new-project": "save"

  initialize: (options) ->
    @model = new @collection.model()

    @model.bind "change:errors", () => @render()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (model) =>
        @model = model
        window.location.hash = "/#{@model.id}/edit"

      error: (model, jqXHR) =>
        @model.set errors: $.parseJSON(jqXHR.responseText)
    )

  render: ->
    $(@el).html @template(@model.toJSON())
    @$("form").backboneLink(@model)

    return this