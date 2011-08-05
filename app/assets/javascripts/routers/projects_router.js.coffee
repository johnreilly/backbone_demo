class Demo.Routers.ProjectsRouter extends Backbone.Router
  initialize: (app) ->
    _.bindAll(this, 'index', 'new', 'edit')
    @projects = new Demo.Collections.ProjectsCollection()

    app.route '/projects', 'index', @index
    app.route '/projects/index', 'index', @index
    app.route '/projects/:id/edit', 'edit', @edit
    app.route '/projects/new', 'new', @new

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