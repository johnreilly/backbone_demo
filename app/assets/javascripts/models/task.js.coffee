class Demo.Models.Task extends Backbone.Model
  paramRoot: 'task'
  defaults:
    name: 'New Task'
    is_done: false

class Demo.Collections.TasksCollection extends Backbone.Collection
  paramRoot: 'tasks'
  model: Demo.Models.Task
  url: '/api/tasks'
