# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.calculateTextareaSize = ->
  $('#new_message textarea').width($('#messages').width() - 6)

window.scrollToLastMessage = ->
  if $('#last_message').size()
    $(window).scrollTop($(document).height())

window.showChangeTopicForm = ->
  $('#change_topic_form').show()
  $('h2#channel_current_topic').hide()

window.hideChangeTopicForm = ->
  $('#change_topic_form').hide()
  $('h2#channel_current_topic').show()

window.imOnline = (channel_id) ->
  setInterval(->
    url = '/channels/'+channel_id+'/im_online'
    $.post url, { _method: 'put' }
  , 5000)

$(document).ready ->
  calculateTextareaSize()
  scrollToLastMessage()

$(window).resize ->
  calculateTextareaSize()
  scrollToLastMessage()
