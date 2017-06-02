ready = ->
  $(document).on 'click', 'input[data-lab_queue_id].btn-primary', (e) ->
    e.preventDefault()
    registrateOnLab($(this))
  $(document).on 'click', 'input[data-lab_queue_id].delete-on-show', (e) ->
    e.preventDefault()
    removeLab($(this))
  $(document).on 'click', 'input[data-lab_queue_id].delete-from-selected', (e) ->
    e.preventDefault()
    id = $(this).data('lab_queue_id')
    self.element = e.target
    $.ajax(
      url: "/lab_queues/#{id}/registrate_on_lab"
      type: 'GET'
    ).done (response) ->
      $(self.element).parents('tr').remove()
$(document).ready(ready)

removeLab = (object) ->
  target_url = $(object).parent().attr('action')
  $.ajax(
    url: target_url
    type: 'GET'
  ).done (response) ->
    $(object).parents('tr').remove()

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
    return
