ready = ->
  $(document).on 'click', '.index input[data-lab_queue_id]:not(.show-more)', (e) ->
    e.preventDefault()
    registrateOnLab($(this))

  $(document).on 'click', 'input[data-lab_queue_id].delete-from-selected', (e) ->
    e.preventDefault()
    registrateOnLab($(this))
    $(this).parents('tr').remove()

  $(document).on 'click', 'input[data-lab_queue_id].btn-danger.delete-on-show', (e) ->
    alert(1)
    e.preventDefault()
    registrateOnLab($(this))
    $(this).parents('tr').remove()

$(document).ready(ready)

registrateOnLab = (object) ->
  $.ajax(
    url: "/lab_queues/#{object.data('lab_queue_id')}/registrate_on_lab"
    type: 'GET'
  ).done (response) ->
    new_value = parseInt($('span.badge').text())
    if object.val() == "Registrate"
      object.removeClass('btn-primary')
      object.addClass('btn-danger')
      object.val('Cancel')
      $('span.badge').text(new_value + 1)
    else
      object.val('Registrate')
      object.removeClass('btn-danger')
      object.addClass('btn-primary')
      $('span.badge').text(new_value - 1)
