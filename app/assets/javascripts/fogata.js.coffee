window.imOnline = (url) ->
  setInterval(->
    $.post url, { _method: 'put' }
  , 5000)

window.scrollToBottom = ->
  $(window).scrollTop($(document).height())
