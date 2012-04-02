$(document).ready ->
  $("#message_text").keypress (event)->
    if (event.which == 13 && event.shiftKey == false)
      $("#new_message").submit()

  $("#new_message").ajaxComplete ->
    $("#new_message")[0].reset()
