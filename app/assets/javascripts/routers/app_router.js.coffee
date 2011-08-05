class Demo.Routers.AppRouter extends Backbone.Router
  initialize: () ->

    @projects ||= new Demo.Routers.ProjectsRouter(this)

    @route '', 'main', @main

  main: ->
    @navigate('/projects', true)


