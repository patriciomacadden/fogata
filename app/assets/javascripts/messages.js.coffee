$(document).ready ->
  $("#message_text").keypress (event)->
    if (event.which == 13 && event.shiftKey == false)
      $("#new_message").submit()

  $("#new_message").ajaxComplete (e, xhr, settings) ->
    regexp = /\/channels\/\d+\/messages/
    if regexp.test(settings.url)
      $(this)[0].reset()
