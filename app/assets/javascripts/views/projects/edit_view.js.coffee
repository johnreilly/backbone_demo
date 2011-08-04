Demo.Views.Projects ||= {}

class Demo.Views.Projects.EditView extends Backbone.View
  template: JST["templates/projects/edit"]

  events:
    "submit #edit-project": "update"
    "click .new-task": "newTask"

  initialize: ->
    _.bindAll(this, 'addAllTasks', 'addNewTask', 'render');
    @model.tasks.bind('reset', @addAllTasks);
    @model.tasks.bind('add', @addNewTask);

  addAllTasks: ->
    @model.tasks.each (task) =>
      view = new Demo.Views.Tasks.ShowView model: task
      @$(".task-list").append(view.render().el)

  addNewTask: (task) ->
    view = new Demo.Views.Tasks.NewView model : task
    @$(".task-list").append(view.render().el)

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save({
      name: @$(":input[name='name']").val()
    },
      success:(model) =>
        @model = model
        window.location.hash = "/index"
    )
    return false

  newTask: (e) ->
    e.preventDefault()
    e.stopPropagation()

    task = new Demo.Models.Task()
    @model.tasks.add(task)

    return false


  render: ->
    $(@el).html @template(@model.toJSON())
    @addAllTasks()

    return this
