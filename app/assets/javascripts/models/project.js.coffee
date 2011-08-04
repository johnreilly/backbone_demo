class Demo.Models.Project extends Backbone.Model
  paramRoot: 'project'
  defaults:
    name: 'New Project'

  initialize: (attrs, options) ->
    super(attrs, options)

class Demo.Collections.ProjectsCollection extends Backbone.Collection
  paramRoot: 'projects'
  model: Demo.Models.Project
  url: '/api/projects'
