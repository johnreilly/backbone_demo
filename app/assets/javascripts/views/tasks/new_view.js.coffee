Demo.Views.Tasks ||= {}

class Demo.Views.Tasks.NewView extends Backbone.View
  template: JST["templates/tasks/new"]

  events:
    "click .cancel" : "cancel"
    "click .save" : "save"

  tagName: 'li'

  render: ->
    $(@el).html @template(@model.toJSON())
    return this

  cancel: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.destroy()
    @remove()

    return false

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    # Not using $.backboneLink here because we need the option to cancel.
    @model.save({
      name: @$(":input[name='name']").val()
    },
      success:(model) =>
        @model = model
        view = new Demo.Views.Tasks.ShowView model: @model
        $(@el).replaceWith view.render().el
    )


    return false