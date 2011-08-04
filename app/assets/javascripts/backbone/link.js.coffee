# jQuery plugin to link up model attrs and DOM fields so we don't
# need to fish out all the values during create/update.
#
# Be sure to set the `name` attribute on your input field to
# match the name of the attribute on the model.
#
# Example:
#
#   If you have a Message model with a `title` and `body` attribute,
#
#   View Template:
#     <input type='text' name='title' />
#     <textarea name='body'></textarea>
#
#   View:
#     render: ->
#       # do whatever you do to put the form in the DOM, then:
#       @$("form").backboneLink(model)

$ = jQuery
$.fn.backboneLink = (model) ->
  $(this).find(":input").each ->
    el = $(this)
    name = el.attr("name")
    model.bind "change:" + name, -> el.val(model.get(name))
    $(this).bind "change", ->
      el = $(this)
      attrs = {}
      attrs[el.attr("name")] = el.val()
      model.set(attrs)

