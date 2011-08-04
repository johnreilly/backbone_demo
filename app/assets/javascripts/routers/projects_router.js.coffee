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
  #
  # new: ->
  #   @view = new Carousel.Views.Templates.NewView(collection: @templates)
  #   $("#templates").html(@view.render().el)
  #
  # edit: (id) ->
  #   tmpl = @templates.get(id)
  #
  #   @view = new Carousel.Views.Templates.EditView(model: tmpl)
  #   $("#templates").html(@view.render().el)

