# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('label.todo.active input').click ->
    todo_id = $(this).attr('data-todo-id')
    $.ajax({
      url: '/todos/' + todo_id,
      type: 'post',
      dataType: 'json',
      data: { '_method': 'put', id: todo_id, todo: {complete: 1} },
      success: ->
        window.location = window.location
    })
