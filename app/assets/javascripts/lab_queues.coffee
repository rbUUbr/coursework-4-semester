$(document).ready ->
  table = $('#table')
  # Table bordered
  $('#table-bordered').change ->
    value = $(this).val()
    table.removeClass('table-bordered').addClass value
    return
  # Table striped
  $('#table-striped').change ->
    value = $(this).val()
    table.removeClass('table-striped').addClass value
    return
  # Table hover
  $('#table-hover').change ->
    value = $(this).val()
    table.removeClass('table-hover').addClass value
    return
  # Table color
  $('#table-color').change ->
    value = $(this).val()
    table.removeClass(/^table-mc-/).addClass value
    return
  return
# jQuery’s hasClass and removeClass on steroids
# by Nikita Vasilyev
# https://github.com/NV/jquery-regexp-classes
((removeClass) ->

  jQuery.fn.removeClass = (value) ->
    if value and typeof value.test == 'function'
      i = 0
      l = @length
      while i < l
        elem = @[i]
        if elem.nodeType == 1 and elem.className
          classNames = elem.className.split(/\s+/)
          n = classNames.length
          while n--
            if value.test(classNames[n])
              classNames.splice n, 1
          elem.className = jQuery.trim(classNames.join(' '))
        i++
    else
      removeClass.call this, value
    this

  return
) jQuery.fn.removeClass
