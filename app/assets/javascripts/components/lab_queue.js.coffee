@Lab = React.createClass
  handleRegistrate: (e) ->
    e.preventDefault()
    $.ajax
      method: 'GET'
      url: "/lab_queues/#{ @props.lab_queue.id}/registrate_on_lab"
      success: () =>

  render: ->
    React.DOM.tr null,
      React.DOM.td null,
        @props.lab_queue.date
      React.DOM.td null,
        @props.lab_queue.id
      React.DOM.td null,
        React.DOM.a
          onClick: @handleRegistrate
          'Watch more'

