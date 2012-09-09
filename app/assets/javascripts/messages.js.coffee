# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#message_text').keypress (event)->
    if (event.which == 13 && event.shiftKey == false)
      $('#new_message').submit()

  $('#new_message').ajaxComplete (e, xhr, settings) ->
    regexp = /\/channels\/\d+\/messages/
    if regexp.test(settings.url)
      $(this)[0].reset()
