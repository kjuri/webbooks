# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  check_to_hide_or_show_add_link = ->
    if $('#answers .nested_fields').length == 5
      $('.add_fields').hide()
    else
      $('.add_fields').show()

  $('.links a').on 'click', ->
    check_to_hide_or_show_add_link()
  check_to_hide_or_show_add_link()
