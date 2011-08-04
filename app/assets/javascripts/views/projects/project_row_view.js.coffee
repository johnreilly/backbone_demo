Demo.Views.Projects ||= {}

class Demo.Views.Projects.ProjectRowView extends Backbone.View
  template: JST["templates/projects/project_row"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    @remove()

    return false

  render: ->
    $(@el).html @template(@model.toJSON())
    return this