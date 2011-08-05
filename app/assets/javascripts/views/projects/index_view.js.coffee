Demo.Views.Projects ||= {}

class Demo.Views.Projects.IndexView extends Backbone.View
  template: JST["templates/projects/index"]

  events:
    "click .new-project": "goToNew"

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');

    @collection.bind('reset', @addAll);

  addAll: () ->
    @$("tbody").empty()
    @collection.each(@addOne)

  addOne: (project) ->
    view = new Demo.Views.Projects.ProjectRowView({model : project})
    @$("tbody").append(view.render().el)

  goToNew: (e) ->
    e.preventDefault()
    e.stopPropagation()
    window.router.navigate('/projects/new', true)

  render: ->
    $(@el).html @template({})
    @addAll()

    return this