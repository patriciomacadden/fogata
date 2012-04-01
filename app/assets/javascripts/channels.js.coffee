# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.calculateTextareaSize = ->
  $('#new_message textarea').width($('#messages').width() - 6)

window.scrollToLastMessage = ->
  $(window).scrollTop($('#last_message').position().top)

$(document).ready ->
  calculateTextareaSize()
  scrollToLastMessage()

$(window).resize ->
  calculateTextareaSize()
  scrollToLastMessage()
