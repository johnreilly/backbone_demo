Demo.Views.Tasks ||= {}

class Demo.Views.Tasks.ShowView extends Backbone.View
  template: JST["templates/tasks/show"]

  events:
    "click .edit" : "edit"
    "click .destroy" : "destroy"
    "click .toggle-done" : "toggleDone"

  render: ->
    $(@el).html @template(@model.toJSON())
    return this

  edit: (e) ->
    e.preventDefault()
    e.stopPropagation()

    view = new Demo.Views.Tasks.EditView model: @model
    $(@el).html(view.render().el)

    return false

  destroy: () ->
    @model.destroy()
    @remove()

    return false

  toggleDone: ->
    @model.save({is_done: !@model.get('is_done')})