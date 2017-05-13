ready = ->
  $('a[data-lab_queue_id]').on 'click', (e) ->
    e.preventDefault()
    registrateOnLab($(e.target))
$(document).ready(ready)
registrateOnLab = (object) ->
  $.ajax(
    url: "/lab_queues/#{object.data('lab_queue_id')}/registrate_on_lab"
    type: 'GET'
  ).done (response) ->
    console.log object
    if object.text() == "Registrate"
      object.text 'Cancel'
    else
      object.text 'Registrate'
    return


