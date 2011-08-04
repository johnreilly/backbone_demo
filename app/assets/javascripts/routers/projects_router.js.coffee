class Demo.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Demo.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    "/new":       "new"
    "/index":     "index"
    "/:id/edit":  "edit"
    "":           "index"


  index: ->
    @view = new Demo.Views.Projects.IndexView(collection: @projects)
    $("#content").html(@view.render().el)

  new: ->
    @view = new Demo.Views.Projects.NewView(collection: @projects)
    $("#content").html(@view.render().el)

  edit: (id) ->
    project = @projects.get(id)

    @view = new Demo.Views.Projects.EditView(model: project)
    $("#content").html(@view.render().el)

