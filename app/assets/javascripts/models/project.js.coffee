class Demo.Models.Project extends Backbone.Model
  paramRoot: 'project'
  defaults:
    name: 'New Project'

  initialize: (attrs, options) ->
    super(attrs, options)
    _.bindAll(this, 'addTask');

    # Create a Tasks collection, then remove the tasks attribute
    @tasks = new Demo.Collections.TasksCollection();
    @tasks.reset @get('tasks')
    @unset("tasks")

    @tasks.bind('add', @addTask)

  addTask: (task) ->
    task.set project_id: @id

class Demo.Collections.ProjectsCollection extends Backbone.Collection
  paramRoot: 'projects'
  model: Demo.Models.Project
  url: '/api/projects'
