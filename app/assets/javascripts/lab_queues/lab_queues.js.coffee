ready = ->
  $('div.index').on 'click', 'input[data-lab_queue_id].btn-primary, .btn-danger', (e) ->
    e.preventDefault()
    registrateOnLab($(e.target))
    alert(1)
  $('div.show').on 'click', 'input[data-lab_queue_id].btn-danger', (e) ->
    e.preventDefault()
    $.ajax(
      url: "/lab_queues/#{$(e.target).data('lab_queue_id')}/registrate_on_lab"
      type: 'GET'
    ).done (response) ->
      $(e.target).parents('tr').remove()
$(document).ready(ready)
registrateOnLab = (object) ->
  alert(2)
  $.ajax(
    url: "/lab_queues/#{object.data('lab_queue_id')}/registrate_on_lab"
    type: 'GET'
  ).done (response) ->
    if object.val() == "Registrate"
      object.removeClass('btn-primary')
      object.addClass('btn-danger')
      object.val('Cancel')
    else
      object.val('Registrate')
      object.removeClass('btn-danger')
      object.addClass('btn-primary')
    return


