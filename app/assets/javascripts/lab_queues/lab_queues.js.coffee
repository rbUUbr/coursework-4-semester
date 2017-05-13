ready = ->
  $('input[data-lab_queue_id].btn-primary').on 'click', (e) ->
    e.preventDefault()
    registrateOnLab($(e.target))
$(document).ready(ready)
registrateOnLab = (object) ->
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


